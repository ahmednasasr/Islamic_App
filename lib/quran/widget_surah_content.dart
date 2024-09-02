import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/quran/surah_details.dart';

class WidgetSurahContent extends StatelessWidget {
  int index;
  String content;

  WidgetSurahContent(this.content,this.index);

  @override
  Widget build(BuildContext context) {
    String verseNumber =
    replaceArabicNumber(" ${index + 1} ");

    return InkWell(
      onTap: (){},
      child:
      Text("$content﴿${verseNumber }﴾",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, fontFamily: "Messiri"
        ),
      ),

    );
  }
}






