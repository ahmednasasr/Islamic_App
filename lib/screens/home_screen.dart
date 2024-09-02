import 'package:flutter/material.dart';

import '../content_screens/ad3ya_mokhtara.dart';
import '../content_screens/after_salah.dart';
import '../content_screens/astikaz.dart';
import '../content_screens/azkar_noom.dart';
import '../content_screens/azkarelsalah.dart';
import '../content_screens/night_screen.dart';
import '../content_screens/sabah_screen.dart';
import '../content_screens/sont_swaak.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 130,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NightScreen()));
                          }, child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(child: Image.asset("assets/iamges/night.png",height: 70,width: 60,)),
                                Expanded(child: Text("اذكار المساء",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),)),
                              ],
                            ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(190, 100),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Color(0xffE2BE7F)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SabahScreen()));
                        }, child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Image.asset("assets/iamges/moon-and-stars.png",height: 70,width: 70,)),
                            Expanded(child: Text("اذكار الصباح",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180, 100),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Color(0xffE2BE7F)),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterSalah()));
                        }, child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Image.asset("assets/iamges/prayer.png",height: 70,width: 60,)),
                            Expanded(child: Text("اذكار بعد الصلاه",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180, 100),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Color(0xffE2BE7F)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AzkarNoom()));
                        }, child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Expanded(child: Image.asset("assets/iamges/praying.png",height: 70,width: 70,)),
                             Expanded(child: Text("اذكار النوم",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),)),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180, 100),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Color(0xffE2BE7F)),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Astikaz()));

                        }, child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Expanded(child: Image.asset("assets/iamges/ىثص.png",height: 70,width: 70,)),
                            Expanded(child: Text("اذكار الاستيقاظ",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),)),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180, 100),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Color(0xffE2BE7F)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SontSwaak()));

                        }, child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Image.asset("assets/iamges/miswak.png",height: 70,width: 70,)),
                            Expanded(child: Text("سنه السواك",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180, 100),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Color(0xffE2BE7F)),
                            ),

                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Ad3yaMokhtara()));

                        }, child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Image.asset("assets/iamges/Screenshot_2024-07-30_005832-removebg-preview.png",height: 70,width: 70,)),
                            Expanded(child: Text("ادعية مختارة",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180, 100),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Color(0xffE2BE7F)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Azkarelsalah()));
                        }, child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Image.asset("assets/iamges/ramadan.png",height: 70,width: 70,)),
                            Expanded(child: Text("اذكار الاذان",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(180, 100),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Color(0xffE2BE7F)),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
