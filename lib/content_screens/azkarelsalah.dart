import 'package:flutter/material.dart';

import '../core/widgets/bg_screen.dart';

class Azkarelsalah extends StatefulWidget {
  Azkarelsalah({super.key});
  static const String routename = "azkarelsalah";

  @override
  _AzkarelsalahScreenState createState() => _AzkarelsalahScreenState();
}

class _AzkarelsalahScreenState extends State<Azkarelsalah> {
  final List<String> azkar = [
    "يَقُولُ مِثْلَ مَا يَقُولُ الـمُؤَذِّنُ إلاَّ فِي حَيَّ عَلَى الصَّلاةِ وَحَيَّ عَلَى الفَلاَحِ فَيَقُولُ: لاَ حَوْلَ وَلا قُوَّةَ إلاَّ باللَّهِ",
    "عنْ سَعْدِ بْن أَبي وقَّاصٍ رضِيَ اللَّه عنْهُ عَن النبي صَلّى اللهُ عَلَيْهِ وسَلَّم أَنَّهُ قَالَ: مَنْ قَال حِينَ يسْمعُ المُؤذِّنَ : أَشْهَد أَنْ لا إِله إِلاَّ اللَّه وحْدهُ لا شَريك لهُ ، وَأَنَّ مُحمَّداً عبْدُهُ وَرسُولُهُ ، رضِيتُ بِاللَّهِ ربًّا ، وبمُحَمَّدٍ رَسُولاً ، وبالإِسْلامِ دِينًا ، غُفِر لَهُ ذَنْبُهُ. رواه مسلم .",
    "عَنْ عبْدِ اللَّهِ بْنِ عَمرِو بْنِ العاصِ رضِيَ اللَّه عنْهُما أَنه سَمِع رسُولَ اللَّهِ صَلّى اللهُ عَلَيْهِ وسَلَّم يقُولُ : إِذا سمِعْتُمُ النِّداءَ فَقُولُوا مِثْلَ ما يَقُولُ ، ثُمَّ صَلُّوا علَيَّ ، فَإِنَّهُ مَنْ صَلَّى علَيَّ صَلاةً صَلَّى اللَّه عَلَيْهِ بِهَا عشْراً ، ثُمَّ سلُوا اللَّه لي الْوسِيلَةَ ، فَإِنَّهَا مَنزِلَةٌ في الجنَّةِ لا تَنْبَغِي إِلاَّ لعَبْدٍ منْ عِباد اللَّه وَأَرْجُو أَنْ أَكُونَ أَنَا هُو ، فَمنْ سَأَل ليَ الْوسِيلَة حَلَّتْ لَهُ الشَّفاعَةُ . رواه مسلم .",
    "عَنْ جابرٍ بن عبد الله رضَي اللَّه عنهما‏ أَنَّ رَسُولَ اللَّهِ صَلّى اللهُ عَلَيْهِ وسَلَّم قَالَ : من قَال حِين يسْمعُ النِّداءَ : اللَّهُمَّ رَبَّ هذِهِ الدَّعوةِ التَّامَّةِ ، والصَّلاةِ الْقَائِمةِ، آت مُحَمَّداً الْوسِيلَةَ ، والْفَضَيِلَة، وابْعثْهُ مقَامًا محْمُوداً الَّذي وعَدْتَه ، حلَّتْ لَهُ شَفَاعتي يوْم الْقِيامِة .رواه البخاري .",
  " اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ عَلَى سَيِّدِنَا مُحَمَّد اللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ، والصَّلاةِ القَائِمَةِ، آتِ مُـحَمَّداً الوَسِيْلَةَ والفَضِيْلَةَ، وابْعَثْهُ مَقَاماً مَـحْمُوداً الَّذِي وَعَدْتَهُ، إنَّكَ لا تُخْلِفُ الـمِيْعَادِ. ",

  ];

  final List<int> requiredCounts = [1, 1, 1, 1, 1, 1 ];
  int currentIndex = 0;
  int currentCount = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BgScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "اذكار الاذان",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    currentCount = 0;
                  });
                },
                itemCount: azkar.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            azkar[index],
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            '${currentCount}/${requiredCounts[currentIndex]}',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous, color: Colors.white),
                    onPressed: () {
                      if (currentIndex > 0) {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: currentCount < requiredCounts[currentIndex]
                        ? incrementCounter
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentCount < requiredCounts[currentIndex]
                          ? Colors.green
                          : Colors.grey,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                    ),
                    child: Text(
                      '$currentCount',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next, color: Colors.white),
                    onPressed: () {
                      if (currentIndex < azkar.length - 1) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void incrementCounter() {
    if (currentCount < requiredCounts[currentIndex]) {
      setState(() {
        currentCount++;
      });
      if (currentCount == requiredCounts[currentIndex]) {
        if (currentIndex < azkar.length - 1) {
          Future.delayed(
              Duration(seconds: 1), () {
            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          });
        }
      }
    }
  }
}