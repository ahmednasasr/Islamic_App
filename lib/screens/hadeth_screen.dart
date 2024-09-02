import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../ahadeth/ahadeth_details.dart';

class HadethScreen extends StatefulWidget {
  HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<HadethScreen> {
  var ahadeth=[
    "الحديث الأول",
    "الحديث الثاني",
    "الحديث الـثـالـث",
    "الحديث الـرابع",
    "الحديث الخامس",
    "الحديث السادس",
    "الحديث السابع",
    "الحديث الثامن",
    "الحديث التاسع",
    "الحديث العاشر",
    "الحديث الحادي عشر",
    "الحد يث الثاني عشر",
    "الحد يث الثالث عشر",
    "الحد يث الرابع عشر",
    "الحد يث الخامس عشر",
    "الحديث السادس عشر",
    "الحديث السابع عشر",
    "الحديث الثامن عشر",
    "الحديث التاسع عشر",
    "الحد يث العشرون",
    "الحديث العاشر",
    "الحديث الحادي والعشرون",
    "الحديث الثاني والعشرون",
    "الحديث الثالث والعشرون",
    "الـحديث الرابع والعشرون",
    "الحديث الخامس والعشرون",
    "الحد يث السادس والعشرون",
    "الحد يث السابع والعشرون",
    "الحد يث الثامن والعشرون",
    "الحد يث التاسع والعشرون",
    "الحديث الثلا ثــون",

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 160,),
        Divider(height: 2,thickness: 3,color: Color(0xffE2BE7F),),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text("hadethnumber".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
        ),
        Divider(height: 2,thickness: 3,color: Color(0xffE2BE7F),),
        Expanded(
          child: ListView.builder(itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, AhadethDetails.routename , arguments: HadethDetailsArg(index, ahadeth[index]));
              },
              child: Text(
                textAlign: TextAlign.center,
                ahadeth[index].tr(),style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            );
          },
            itemCount: 30,
          ),
        )
      ],
    );
  }
}