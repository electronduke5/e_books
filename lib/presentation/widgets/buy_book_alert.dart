import 'package:e_books/presentation/cubits/book/book_cubit.dart';
import 'package:e_books/presentation/cubits/models_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/book.dart';
import '../../data/models/user.dart';
import '../cubits/profile/profile_cubit.dart';
import '../di/app_module.dart';

class EBooksDialogs{
  static Future openConfirmPurchaseDialog(BuildContext context, Book book, BookCubit cubit, ProfileCubit profileCubit) async {
    showDialog(
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> cubit),
            BlocProvider(create: (context)=> profileCubit),
          ],
          child: AlertDialog(
            title: const Text('Покупка книги'),
            content: AppModule.getProfileHolder().user.wallet >= 50
                ? Text(
                'Вы действитоелно хотите купить книгу "${book.title}"\nЦена книги: 50 деняк\n На вашем счету: ${AppModule.getProfileHolder().user.wallet}')
                : const Text(
                'На вашем счету недостаточно средств. \nЧтобы заработать деньки, вы можете оставлять отзывы на уже прочитанные книги.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                },
                child: const Text('Отмена'),
              ),
                  () {
                final User user = AppModule.getProfileHolder().user;
                if (user.wallet >= 50) {
                  return BlocBuilder<BookCubit, BookState>(
                      builder: (context, state) {
                      return TextButton(
                        onPressed: () async {
                          await cubit.buyBook(book.id, user.id).then((value) {
                            //context.read<ProfileCubit>().loadProfile(user: user, isFromApi: true);
                            Navigator.pop(context);
                          });
                        },
                        child: (){
                          if(state.buyBookStatus is LoadingStatus){
                            return const Center(child: CircularProgressIndicator(),);
                          }
                          else {
                            return const Text('Купить');
                          }
                        }(),
                      );
                    }
                  );
                } else {
                  return const SizedBox();
                  // SnackBarInfo.show(context: context, message: 'На вашем счету недостаточно средств', isSuccess: false);
                }
              }(),
            ],
          ),
        );
      },
    );
  }
}