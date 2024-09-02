
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/screens/quran_screen.dart';
import 'package:islamic_app/screens/sebha_screen.dart';
import 'package:islamic_app/screens/settings_screen.dart';


import '../core/widgets/bg_screen.dart';
import 'hadeth_screen.dart';
import 'home_screen.dart';
import 'moaket_salah.dart';


class LayoutScreen extends StatefulWidget {
  static const String routename = "layoutscreen";

  LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> with SingleTickerProviderStateMixin {
  int selectedindex = 2;
  late AnimationController _controller;

  List<Widget> screens = [
    QuranScreen(),
    SebhaScreen(),
    HomeScreen(),
    HadethScreen(),
    PrayerTimesScreen(),
    SettingsScreen()
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BgScreen(
      child: Scaffold(
        appBar: AppBar(),
        body: screens[selectedindex],
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    colors: [Colors.amber, Colors.green],
                    tileMode: TileMode.mirror,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, _controller.value],
                  ).createShader(rect);
                },
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              backgroundColor: Colors.white10,
            );
          },
        ),
        bottomNavigationBar: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  selectedindex = value;
                });
              },
              currentIndex: selectedindex,
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage("assets/iamges/quran.png"),
                        size: 50),
                    label: "Quran".tr()),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage("assets/iamges/sebha.png"),
                        size: 50),
                    label: "Sebha".tr()),
                BottomNavigationBarItem(
                    icon: SizedBox.shrink(), label: ""),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage("assets/iamges/Group 6.png"),
                        size: 50),
                    label: "Ahadeth".tr()),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage("assets/iamges/2800493.png"),
                        size: 40),
                    label: "Salah".tr()),
              ],
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              showUnselectedLabels: Theme.of(context).bottomNavigationBarTheme.showUnselectedLabels ?? false,
              elevation: 16,
            ),
            Positioned(
              bottom: 10,
              child: Container(
                width: 80,
                height: 70,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      selectedindex = 2;
                    });
                  },
                  child: ImageIcon(
                    AssetImage("assets/iamges/eco-house.png"),
                    size: 40,
                    color: Color(0xffE6AF2F),
                  ),
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Color(0xffE2BE7F),
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




