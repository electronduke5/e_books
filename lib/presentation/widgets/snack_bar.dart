import 'package:flutter/material.dart';

class SnackBarInfo {
  SnackBarInfo.show(
      {required BuildContext context,
      required String message,
      required bool isSuccess}) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      content: Text(message),
      backgroundColor:
          isSuccess ? const Color.fromRGBO(15, 202, 122, 1) : Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  SnackBarInfo.showTop(
      {required BuildContext context,
      required String message,
      required bool isSuccess}) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 10,
        right: 10,
      ),
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
