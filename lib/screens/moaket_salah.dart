import 'package:adhan/adhan.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamic_app/screens/qiblah_screen.dart';

import '../location/location.dart';
class PrayerTimesScreen extends StatefulWidget {
  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  late Future<PrayerTimes> _prayerTimesFuture;
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _prayerTimesFuture = _getPrayerTimes();
  }

  Future<PrayerTimes> _getPrayerTimes() async {
    try {
      Position? position = await _locationService.getCurrentLocation();

      if (position == null) {
        throw Exception('Unable to get location');
      }

      final myCoordinates = Coordinates(position.latitude, position.longitude);
      final params = CalculationMethod.egyptian.getParameters();
      params.madhab = Madhab.hanafi;

      return PrayerTimes.today(myCoordinates, params);
    } catch (e) {
      print('Error getting prayer times: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'.tr(), style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: FutureBuilder<PrayerTimes>(
        future: _prayerTimesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error.toString()}'));
          } else if (snapshot.hasData) {
            final prayerTimes = snapshot.data!;
            final prayerNames = [
              'الفجر',
              'الشروق',
              'الظهر',
              'العصر',
              'المغرب',
              'العشاء'
            ];
            final prayerTimesFormatted = [
              DateFormat.jm().format(prayerTimes.fajr),
              DateFormat.jm().format(prayerTimes.sunrise),
              DateFormat.jm().format(prayerTimes.dhuhr),
              DateFormat.jm().format(prayerTimes.asr),
              DateFormat.jm().format(prayerTimes.maghrib),
              DateFormat.jm().format(prayerTimes.isha),
            ];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ...List.generate(prayerNames.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: PrayerTimeTile(
                        prayerName: prayerNames[index].tr(),
                        prayerTime: prayerTimesFormatted[index],
                      ),
                    );
                  }),
                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffE2BE7F), // لون الزر
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'اتجاه القبلة'.tr(),
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QiblahScreen(), // تأكد من مسار صفحة القبلة
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('لا توجد بيانات لعرضها'));
          }
        },
      ),
    );
  }
}

class PrayerTimeTile extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  PrayerTimeTile({required this.prayerName, required this.prayerTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE2BE7F).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffE2BE7F), width: 2),
      ),
      child: ListTile(
        title: Text(
          prayerName.tr(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffE2BE7F),
          ),
        ),
        trailing: Text(
          prayerTime.tr(),
          style: TextStyle(
            fontSize: 18,
            color: Color(0xffE2BE7F),
          ),
        ),
        leading: Icon(
          Icons.access_time,
          color: Color(0xffE2BE7F),
        ),
      ),
    );
  }
}
