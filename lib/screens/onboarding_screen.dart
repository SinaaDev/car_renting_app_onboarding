import 'package:car_renting_app_onboarding/home_screen.dart';
import 'package:car_renting_app_onboarding/screens/page1.dart';
import 'package:car_renting_app_onboarding/screens/page2.dart';
import 'package:car_renting_app_onboarding/screens/page3.dart';
import 'package:car_renting_app_onboarding/screens/page4.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _selectedIndex = 0;
  final pageController = PageController();

  Color get color {
    if (_selectedIndex == 0) {
      return HexColor('#F0CF69');
    }
    if (_selectedIndex == 1) {
      return HexColor('#B7ABFD');
    }
    if (_selectedIndex == 2) {
      return HexColor('#EFB491');
    }
    return HexColor('#95B6FF');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: const [Page1(), Page2(), Page3(), Page4()],
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 16,
            child: SafeArea(
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: AnimatedDot(
                                  isActive: _selectedIndex == index),
                            ),
                          ),
                        ),
                        const Text(
                          'Skip',
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                      ],
                    ),
                    const Spacer(),
                    _customProgress(
                        context, _selectedIndex, pageController, color)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedDot extends StatelessWidget {
  final bool isActive;

  const AnimatedDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white38,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

Widget _customProgress(BuildContext context, int currentPage,
    PageController pageController, Color color) {
  return Stack(
    alignment: Alignment.center,
    children: [
      SizedBox(
        width: 80,
        height: 80,
        child: CircleProgressBar(
          backgroundColor: Colors.white38,
          foregroundColor: Colors.white,
          value: ((currentPage) / 3),
        ),
      ),
      Container(
        height: 45,
        width: 45,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: IconButton(
          onPressed: () {
            if (currentPage == 3) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const HomeScreen()));
            }
            pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
          ),
          iconSize: 15,
          color: color,
        ),
      )
    ],
  );
}
