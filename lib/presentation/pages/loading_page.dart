import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Text('Loading Page'),
      ),
    );
  }
}
