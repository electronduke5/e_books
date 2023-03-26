import 'package:flutter/material.dart';

class PopupIconMenuItem extends PopupMenuItem<String> {
  final String title;
  final IconData icon;
  @override
  final Color? color;

  PopupIconMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.color,
  }) : super(
          value: title,
          child: SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Flexible(child: Text(title, style: TextStyle(color: color))),
              ],
            ),
          ),
        );
}
