import 'package:flutter/material.dart';

class SliderModel {
  String image;

  SliderModel({required this.image});
}

List<SliderModel> getSlides() {
  return [
    SliderModel(image: "assets/onboarding_1.png"),
    SliderModel(image: "assets/onboarding_2.png"),
    SliderModel(image: "assets/onboarding_3.png"),
  ];
}

List<String> slideTexts = [
  "Feeling Lazy to on a switch?",
  "Want a smart home?",
  "Use our homesync app to get solution",
];

List<String> slideTexts2 = [
  "Let HomeSync handle it!",
  "HomeSync has you covered!",
  "Sync your home, simplify life!",
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 44, 44),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 44, 44),
        title: Text(
          "Khao",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 30), // Add space above image
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: getSlides().length,
                    itemBuilder: (context, index) {
                      return Slide(
                        image: getSlides()[index].image,
                        text: slideTexts[index],
                        text2: slideTexts2[index],
                        isLastSlide: index == getSlides().length - 1,
                        onNextPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/selectroom');
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  bottom: 20), // Adjust the distance from the bottom as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  getSlides().length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
    );
  }
}

class Slide extends StatelessWidget {
  final String image;
  final String text;
  final String text2;
  final bool isLastSlide;
  final VoidCallback onNextPressed;

  Slide(
      {required this.image,
      required this.text,
      required this.text2,
      required this.isLastSlide,
      required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(image,
              height: MediaQuery.of(context).size.height *
                  0.5), // Adjust image height
          SizedBox(height: 25),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          if (isLastSlide)
            SizedBox(
                height:
                    20), // Add some space before the button on the last slide
          if (isLastSlide)
            ElevatedButton(
              onPressed: onNextPressed,
              child: Text(
                'Next',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
