// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_compass_v2/flutter_compass_v2.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:stream_transform/stream_transform.dart' show CombineLatest;
//
// import '../qiblah/utils.dart';
//
// class QiblahScreen extends StatefulWidget {
//   const QiblahScreen({Key? key}) : super(key: key);
//
//   @override
//   _QiblahScreenState createState() => _QiblahScreenState();
// }
//
// class _QiblahScreenState extends State<QiblahScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkPermissionsAndInit();
//   }
//
//   Future<void> _checkPermissionsAndInit() async {
//     LocationPermission permission = await FlutterQiblah.requestPermissions();
//     if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
//       // Handle permission denied scenario
//       print("Location permission denied.");
//     } else {
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('اتجاه القبلة'),
//       ),
//       body: FutureBuilder(
//         future: FlutterQiblah.checkLocationStatus(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final status = snapshot.data as LocationStatus;
//           if (status.enabled && status.status == LocationPermission.whileInUse) {
//             return StreamBuilder<QiblahDirection>(
//               stream: FlutterQiblah.qiblahStream,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 if (snapshot.hasError) {
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 }
//
//                 if (snapshot.hasData) {
//                   final qiblahDirection = snapshot.data!;
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'اجعل السهمين في اتجاه بعضهم البعض',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Transform.rotate(
//                               angle: qiblahDirection.qiblah * (3.1415927 / 180), // تحويل الزاوية إلى راديان
//                               child: Container(
//                                 width: 300,
//                                 height: 300,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(color: Colors.orange, width: 6),
//                                 ),
//                               ),
//                             ),
//                             Image.asset(
//                               'assets/images/kaaba.png', // صورة الكعبة
//                               width: 100,
//                               height: 100,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//
//                 return const Center(child: Image(image: AssetImage("assets/iamges/—Pngtree—kaaba at mecca_8058030.png")));
//               },
//             );
//           } else {
//             return const Center(child: Text('Location services are disabled or permission denied'));
//           }
//         },
//       ),
//       backgroundColor: Color(0xFF2C003E), // لون الخلفية البنفسجي
//     );
//   }
// }
//
// class FlutterQiblah {
//   static const MethodChannel _channel = const MethodChannel('ml.medyas.flutter_qiblah');
//
//   static final FlutterQiblah _instance = FlutterQiblah._();
//
//   Stream<QiblahDirection>? _qiblahStream;
//
//   FlutterQiblah._();
//
//   factory FlutterQiblah() => _instance;
//
//   static Future<bool?> androidDeviceSensorSupport() async {
//     if (Platform.isAndroid) return await _channel.invokeMethod("androidSupportSensor");
//     return true;
//   }
//
//   static Future<LocationPermission> requestPermissions() => Geolocator.requestPermission();
//
//   static Future<LocationStatus> checkLocationStatus() async {
//     final status = await Geolocator.checkPermission();
//     final enabled = await Geolocator.isLocationServiceEnabled();
//     return LocationStatus(enabled, status);
//   }
//
//   static Stream<QiblahDirection> get qiblahStream {
//     if (_instance._qiblahStream == null) {
//       _instance._qiblahStream = _merge<CompassEvent, Position>(
//         FlutterCompass.events!,
//         Geolocator.getPositionStream(),
//       );
//     }
//     return _instance._qiblahStream!;
//   }
//
//   static Stream<QiblahDirection> _merge<A, B>(
//       Stream<A> streamA,
//       Stream<B> streamB,
//       ) =>
//       streamA.combineLatest<B, QiblahDirection>(
//         streamB,
//             (dir, pos) {
//           final position = pos as Position;
//           final event = dir as CompassEvent;
//
//           final offSet = Utils.getOffsetFromNorth(
//             position.latitude,
//             position.longitude,
//           );
//
//           final qiblah = (event.heading ?? 0.0) + (360 - offSet);
//
//           return QiblahDirection(qiblah, event.heading ?? 0.0, offSet);
//         },
//       );
//
//   void dispose() {
//     _qiblahStream = null;
//   }
// }
//
// class LocationStatus {
//   final bool enabled;
//   final LocationPermission status;
//
//   const LocationStatus(this.enabled, this.status);
// }
//
// class QiblahDirection {
//   final double qiblah;
//   final double direction;
//   final double offset;
//
//   const QiblahDirection(this.qiblah, this.direction, this.offset);
// }


import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stream_transform/stream_transform.dart' show CombineLatest;

import '../core/widgets/bg_screen.dart';


class QiblahScreen extends StatefulWidget {
  const QiblahScreen({Key? key}) : super(key: key);
  static const String routename="qiblah";

  @override
  _QiblahScreenState createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen> {
  @override
  void initState() {
    super.initState();
    _checkPermissionsAndInit();
  }

  Future<void> _checkPermissionsAndInit() async {
    LocationPermission permission = await FlutterQiblah.requestPermissions();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      // Handle permission denied scenario
      print("Location permission denied.");
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BgScreen(
        child:Scaffold(
        appBar: AppBar(
        title: const Text('اتجاه القبلة',style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder(
        future: FlutterQiblah.checkLocationStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final status = snapshot.data as LocationStatus;
          if (status.enabled && status.status == LocationPermission.whileInUse) {
            return StreamBuilder<QiblahDirection>(
              stream: FlutterQiblah.qiblahStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                if (snapshot.hasData) {
                  final qiblahDirection = snapshot.data!;
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'اجعل السهمين في اتجاه بعضهم البعض',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.orange, width: 6),
                              ),
                            ),
                            Transform.rotate(
                              angle: qiblahDirection.qiblah * (3.1415927 / 180), // دوران صورة الكعبة في اتجاه القبلة
                              child: Image.asset(
                                'assets/iamges/—Pngtree—kaaba at mecca_8058030.png', // صورة الكعبة
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Transform.rotate(
                              angle: qiblahDirection.qiblah * (3.1415927 / 180), // دوران السهم الأول مع اتجاه القبلة
                              child: Icon(
                                Icons.navigation, // أيقونة السهم
                                size: 100,
                                color: Colors.orange,
                              ),
                            ),
                            Transform.rotate(
                              angle: -qiblahDirection.direction * (3.1415927 / 180), // دوران السهم الثاني مع اتجاه الجهاز
                              child: Icon(
                                Icons.arrow_drop_up, // أيقونة السهم الآخر
                                size: 150,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }

                return const Center(child: Image(image: AssetImage("assets/iamges/—Pngtree—kaaba at mecca_8058030.png")));
              },
            );
          } else {
            return const Center(child: Text('Location services are disabled or permission denied'));
          }
        },
      ),
    )
    );
  }
}

