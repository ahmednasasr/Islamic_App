import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/widgets/bg_screen.dart';

class AboutUs extends StatelessWidget {
  static const String routename="aboutUs";
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return BgScreen(child: Scaffold(
      appBar: AppBar(foregroundColor: Colors.white,),
        body: Center(
          child: SingleChildScrollView(
            child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 64,horizontal: 24),
                  child: Text(
                    "The Islamic application is an application that contains the entire Holy Qur’an for reading. It contains the entire Qur’an for listening by Sheikh Muhammad Siddiq Al-Minshawi. It includes a group of hadiths. It contains morning remembrances, evening remembrances, sleeping remembrances, after-prayer remembrances, and waking up remembrances. It contains a rosary that changes the supplication with the number 33. The application is free, developed by Ahmed Nassar.".tr(),style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
          
                  ),
                )
                ),
        ),
        )
    );
  }
}
