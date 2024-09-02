import 'package:flutter/material.dart';

import '../core/widgets/bg_screen.dart';

class Astikaz extends StatefulWidget {
  Astikaz({super.key});
  static const String routename = "astikaz";

  @override
  _AstikazScreenState createState() => _AstikazScreenState();
}

class _AstikazScreenState extends State<Astikaz> {
  final List<String> azkar = [
    "الحَمْـدُ لِلّهِ الّذي أَحْـيانا بَعْـدَ ما أَماتَـنا وَإليه النُّـشور.",
    "الحمدُ للهِ الذي عافاني في جَسَدي وَرَدّ عَليّ روحي وَأَذِنَ لي بِذِكْرِه.",
    "لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شَـريكَ له، لهُ المُلـكُ ولهُ الحَمـد، وهوَ على كلّ شيءٍ قدير، سُـبْحانَ اللهِ، والحمْـدُ لله ، ولا إلهَ إلاّ اللهُ واللهُ أكبَر، وَلا حَولَ وَلا قوّة إلاّ باللّهِ العليّ العظيم. رَبِّ اغْفرْ لي.",
  ];

  final List<int> requiredCounts = [1, 1, 1 ];
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
            "اذكار الاستيقاظ",
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
