import 'package:flutter/material.dart';
class BgScreen extends StatelessWidget {
  Widget child;

   BgScreen({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(
              "assets/iamges/WhatsApp Image 2024-08-01 at 2.33.31 AM.jpeg"),
              fit: BoxFit.cover)),
      child: child
    );;
  }
}
