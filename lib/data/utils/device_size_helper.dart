import 'package:flutter/material.dart';

class DeviceSizeHelper{
  static int getAxisCount(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    if(MediaQuery.of(context).size.width > 770) {
      return 4;
    }
    else if (MediaQuery.of(context).size.width > 575) {
      return 3;
    }
    else {
      return 2;
    }
  }
}