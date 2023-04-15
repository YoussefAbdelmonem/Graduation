
import 'package:flutter/material.dart';
import 'package:meaw/components/colors.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/meow.png'),
            const SizedBox(height: 50,),
            TextButton(
              onPressed: (){},
              child: const Text('Tap to translate',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Jannah',
                  color: defaultColor
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
