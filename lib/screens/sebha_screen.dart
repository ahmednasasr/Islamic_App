import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> with SingleTickerProviderStateMixin {
  int counter = 0;
  final List<String> tasbeh = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];
  int index = 0;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeTasbeh() {
    setState(() {
      counter++;
      if (counter % 33 == 0) {
        index = (index + 1) % tasbeh.length;
        counter = 0;
      }
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Image.asset(
              "assets/iamges/head of seb7a.png",
              height: 50,
            ),
            RotationTransition(
              turns: _animation,
              child: Image.asset(
                "assets/iamges/body of seb7a.png",
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "عدد التسبيحات",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xffE2BE7F)),
              ),
              height: 70,
              width: 60,
              child: Center(
                child: Text(
                  "$counter",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.transparent,
              height: 100,
              width: 400,
              child: ElevatedButton(
                onPressed: changeTasbeh,
                child: Text(
                  tasbeh[index],
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




