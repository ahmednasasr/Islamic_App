import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/quran/surah_details.dart';
import 'package:islamic_app/screens/Layout_screen.dart';
import 'package:islamic_app/screens/about_us.dart';
import 'package:islamic_app/screens/qiblah_screen.dart';
import 'package:islamic_app/screens/splash_screen.dart';
import 'ahadeth/ahadeth_details.dart';
import 'content_screens/ad3ya_mokhtara.dart';
import 'content_screens/after_salah.dart';
import 'content_screens/astikaz.dart';
import 'content_screens/azkarelsalah.dart';
import 'content_screens/night_screen.dart';
import 'content_screens/sabah_screen.dart';
import 'content_screens/sont_swaak.dart';
import 'screens/settings_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(child: IslamicApp(),
          fallbackLocale: Locale('en'),
          supportedLocales: [Locale("en"),Locale("ar")],
          path: "assets/translation")
  );
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Color(0xff130A4E),
            fontWeight: FontWeight.w900,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xff130A4E),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          showUnselectedLabels: false,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff195A6E)
          ),
        )
      ),
      routes: {
        LayoutScreen.routename: (_) => LayoutScreen(),
        SplashScreen.routename: (_) => SplashScreen(),
        SabahScreen.routename:(_)=> SabahScreen(),
        NightScreen.routename:(_)=>NightScreen(),
        AfterSalah.routename:(_)=>AfterSalah(),
        Astikaz.routename:(_)=>Astikaz(),
        Azkarelsalah.routename:(_)=>Azkarelsalah(),
        Ad3yaMokhtara.routename:(_)=>Ad3yaMokhtara(),
        SontSwaak.routename:(_)=>SontSwaak(),
        SurahDetails.routename:(_)=>SurahDetails(),
        AhadethDetails.routename:(_)=>AhadethDetails(),
        SettingsScreen.routename:(_)=>SettingsScreen(),
        AboutUs.routename:(_)=>AboutUs(),
        QiblahScreen.routename:(_)=>QiblahScreen()
      },
      initialRoute: SplashScreen.routename,
    );
  }
}
