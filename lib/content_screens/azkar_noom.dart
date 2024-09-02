import 'package:flutter/material.dart';

import '../core/widgets/bg_screen.dart';

class AzkarNoom extends StatefulWidget {
  AzkarNoom({super.key});
  static const String routename = "azkarnoom";

  @override
  _azkarnoomScreenState createState() => _azkarnoomScreenState();
}

class _azkarnoomScreenState extends State<AzkarNoom> {
  final List<String> azkar = [
    " بِاسْمِكَ رَبِّـي وَضَعْـتُ جَنْـبي ، وَبِكَ أَرْفَعُـه، فَإِن أَمْسَـكْتَ نَفْسـي فارْحَـمْها ، وَإِنْ أَرْسَلْتَـها فاحْفَظْـها بِمـا تَحْفَـظُ بِه عِبـادَكَ الصّـالِحـين.",
    "اللّهُـمَّ إِنَّـكَ خَلَـقْتَ نَفْسـي وَأَنْـتَ تَوَفّـاهـا لَكَ ممَـاتـها وَمَحْـياها ، إِنْ أَحْيَيْـتَها فاحْفَظْـها ، وَإِنْ أَمَتَّـها فَاغْفِـرْ لَـها . اللّهُـمَّ إِنَّـي أَسْـأَلُـكَ العـافِـيَة.",
    "اللّهُـمَّ قِنـي عَذابَـكَ يَـوْمَ تَبْـعَثُ عِبـادَك.",
    " بِاسْـمِكَ اللّهُـمَّ أَمـوتُ وَأَحْـيا.",
    "الـحَمْدُ للهِ الَّذي أَطْـعَمَنا وَسَقـانا، وَكَفـانا، وَآوانا، فَكَـمْ مِمَّـنْ لا كـافِيَ لَـهُ وَلا مُـؤْوي.",
    " اللّهُـمَّ عالِـمَ الغَـيبِ وَالشّـهادةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كُـلِّ شَـيءٍ وَمَليـكَه، أَشْهـدُ أَنْ لا إِلـهَ إِلاّ أَنْت، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي، وَمِن شَـرِّ الشَّيْـطانِ وَشِـرْكِه، وَأَنْ أَقْتَـرِفَ عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم."
    "سُبْحَانَ اللَّهِ.",
    " الْحَمْدُ لِلَّهِ.",
    "اللَّهُ أَكْبَرُ.",
    "يجمع كفيه ثم ينفث فيهما والقراءة فيهما: {قل هو الله } {قل أعوذ برب الفلق و{قل أعوذ برب الناس ومسح ما استطاع من الجسد يبدأ بهما على رأسه ووجه وما أقبل من جسده.",
    " آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ. [البقرة 285 - 286]",
    " اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ. [البقرة 255]",
    " عن عمرو بن شعيب، عن أبيه، عن جده: أن رسول الله صلى الله عليه وسلم كان يعلمهم من الفزع كلمات أعوذ بكلمات الله التامة من غضبه وشر عباده، ومن همزات الشياطين وأن يحضرون",
  ];

  final List<int> requiredCounts = [1, 1, 3, 1, 1, 33,33, 34, 3, 1, 1, 1];
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
            "اذكار النوم",
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

