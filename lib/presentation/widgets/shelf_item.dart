import 'package:e_books/presentation/cubits/models_status.dart';
import 'package:e_books/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/shelf.dart';
import '../cubits/shelves/shelf_cubit.dart';

class ShelfItem extends StatelessWidget {
  const ShelfItem({
    super.key,
    required this.shelf,
  });

  final Shelf shelf;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shelf.title),
                  const LinearProgressIndicator(
                    semanticsValue: "Value",
                    minHeight: 3.0,
                    value: 0.6,
                  ),
                ],
              ),
            ),
            Text("0/${shelf.books?.length ?? 0}"),
            const IntrinsicHeight(
              child: VerticalDivider(width: 1, color: Colors.black),
            ),
            BlocListener<ShelfCubit, ShelfState>(
              listener: (context, state) {
                if (state.deleteStatus.runtimeType == LoadingStatus) {
                  SnackBarInfo.show(
                      context: context, message: 'Удаление...', isSuccess: true);
                }
              },
              child: IconButton(
                onPressed: () async {
                  await context.read<ShelfCubit>().deleteShelf(shelf).then((value) async {
                    SnackBarInfo.show(
                        isSuccess: true,
                        context: context,
                        message: "Полка '${shelf.title}' удалена.");
                    await context.read<ShelfCubit>().loadShelves();
                  });
                },
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
