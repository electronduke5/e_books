import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Material(
        color: const Color.fromRGBO(175, 43, 61, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/alpha.png'),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                'Читайте без ограничений!',
                style: TextStyle(
                  fontFamily: GoogleFonts.literata().fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
