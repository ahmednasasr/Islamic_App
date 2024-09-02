import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../core/widgets/bg_screen.dart';
import 'about_us.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({super.key});
   static const String routename="settingscreen";


  @override
  Widget build(BuildContext context) {
    return BgScreen(
     child:Scaffold(
       appBar: AppBar(foregroundColor: Colors.white,),
     body:SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 170),
            Padding(
                padding: EdgeInsets.all(8.0),
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(width: 20),
                  Text(
                    "language".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<Locale>(
                    dropdownColor:  Color(0xffE2BE7F),
                    borderRadius: BorderRadius.circular(20),
                    value: context.locale,
                    onChanged: (Locale? newLocale) {
                      if (newLocale != null) {
                        context.setLocale(newLocale);
                      }
                    },
                    items: [
                      DropdownMenuItem(
                        value: Locale('en'),
                        child: Text("english".tr(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      ),
                      DropdownMenuItem(
                        value: Locale('ar'),
                        child: Text("arabic".tr(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      )
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                    
                      ),
                        onPressed: (){
                      Navigator.pushNamed(context, AboutUs.routename);
                    }, child: Text("about us".tr(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                        fontSize: 30),)),
                  )

                ]
                )
            )
          ]
          )
     ), // Close SingleChildScrollView
    )
    );
  }
}