import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/quran/widget_surah_content.dart';

import '../core/widgets/bg_screen.dart';


class SurahDetails extends StatefulWidget {
  static const String routename = "surahdetails";

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  List<String> surahverses=[];
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahDetailsArg;
    if(surahverses.isEmpty) {
      readFileData(args.surahIndex);
    }
    return BgScreen(child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text('السورة',style: TextStyle(color: Colors.white),),
        ),
        body: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 24,
          margin: EdgeInsets.symmetric(vertical: 64,horizontal: 24),
          child: surahverses.isNotEmpty?
          ListView.separated(itemBuilder: (context,index){
             return WidgetSurahContent(surahverses[index],index);
          },
            itemCount: surahverses.length,
            separatorBuilder: (context, index) =>
            Container(height: 10),
          )
              :Center(child: CircularProgressIndicator(),)
        )
    )
    );

  }
  void readFileData(int fileindex) async {
    String surahcontent = await rootBundle.loadString("assets/surah/${fileindex+1}.txt");
  List<String> surahlines =surahcontent.trim().split("\n");
  setState(() {
  surahverses=surahlines;
  });
}
}
class SurahDetailsArg {
  final int surahIndex;
  final String surahTitle;
  SurahDetailsArg(this.surahIndex, this.surahTitle);
}
String replaceArabicNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }

  return input;
}

