import 'package:e_books/presentation/cubits/models_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/shelf.dart';
import '../cubits/shelves/shelf_cubit.dart';
import '../widgets/shelf_item.dart';
import '../widgets/snack_bar.dart';

class ShelvesPage extends StatelessWidget {
  ShelvesPage({Key? key}) : super(key: key);

  final scaffoldState = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();

  void _showSheet() {
    // Show BottomSheet here using the Scaffold state instead ot«f the Scaffold context
    scaffoldState.currentState?.showBottomSheet(
      (context) => BlocBuilder<ShelfCubit, ShelfState>(builder: (context, state) {
        return SizedBox(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Создание полки',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите название полки';
                        }
                        if (value.length >= 30) {
                          return 'Максимум - 30 символов';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Название полки',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                BlocListener<ShelfCubit, ShelfState>(
                  listener: (context, state) {
                    if (state.createShelfStatus.runtimeType == LoadingStatus<Shelf>) {
                      SnackBarInfo.show(
                          context: context, message: 'Полка создается', isSuccess: true);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final title = titleController.value.text;
                        titleController.clear();
                        await context.read<ShelfCubit>().createShelf(title).then((value) {
                          Navigator.of(context).pop();
                          SnackBarInfo.show(
                              context: context,
                              message: 'Полка создана',
                              isSuccess: true);
                        });
                        await context.read<ShelfCubit>().loadShelves();
                      }
                    },
                    child: Text('Создать'),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text('Мои полки'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSheet(),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<ShelfCubit>().loadShelves();
        },
        child: BlocBuilder<ShelfCubit, ShelfState>(
          builder: (context, state) {
            switch (state.shelvesStatus.runtimeType) {
              case LoadingStatus<List<Shelf>>:
                return const Center(child: CircularProgressIndicator());
              case FailedStatus<List<Shelf>>:
                return const Center(child: Text('Ошибка при получении ваших полок :('));
              case LoadedStatus<List<Shelf>>:
                return ListView.builder(
                  itemCount: state.shelvesStatus.item?.length,
                  itemBuilder: (context, index) {
                    return ShelfItem(shelf: state.shelvesStatus.item![index]);
                  },
                );
              default:
                return const Center(child: Text('Что-то пошло не так...'));
            }
          },
        ),
      ),
    );
  }
}
