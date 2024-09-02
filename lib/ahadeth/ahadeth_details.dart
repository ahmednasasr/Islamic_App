import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/widgets/bg_screen.dart';
import '../quran/widget_surah_content.dart';


class AhadethDetails extends StatefulWidget {
  static const String routename = "hadethdetails";

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  List<String> verses=[];
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetailsArg;
    if(verses.isEmpty) {
      readhadethData(args.HadethIndex);
    }
    return BgScreen(child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text('الحديث',style: TextStyle(color: Colors.white),),
        ),
        body: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            elevation: 24,
            margin: EdgeInsets.symmetric(vertical: 64,horizontal: 24),
            child: verses.isNotEmpty?
            ListView.builder(itemBuilder: (context,index){
              return WidgetSurahContent(verses[index],index);
            },
              itemCount: verses.length,
            )
                :Center(child: CircularProgressIndicator(),)
        )
    )
    );

  }
  void readhadethData(int fileindex) async {
    String fileContent = await rootBundle.loadString( 'assets/ahadeth/h${fileindex+1}.txt');
    List<String> lines =fileContent.trim().split("/n");
    setState(() {
      verses=lines;
    });
  }
}
class HadethDetailsArg {
  final int HadethIndex;
  final String HadethTitle;

  HadethDetailsArg(this.HadethIndex, this.HadethTitle);
}

