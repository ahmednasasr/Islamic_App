import 'package:flutter/widgets.dart';

class SurahName extends StatelessWidget {
  String title;
   SurahName({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,

    ),
    ) ;
  }
}
