import 'package:flower_shop/features/authentication/OnBoarding/onboardingCustomWidgit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flower_shop/features/authentication/login/veiw/loginscreen.dart';

class OnBoardingPageView extends StatefulWidget {
  @override
  _OnBoardingPageViewState createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Widget> onboardingPages = const [
    OnboardingCustomWidget(
      label1: 'Choose your delivery location',
      label2: 'Tell us where you\'d like the flowers to be delivered, and we\'ll make sure they reach the right place, right on time.',
      image: 'assets/onboarding1.png',
      pagenum: '1',
    ),
    OnboardingCustomWidget(
      label1: 'Choose your favorite flowers',
      label2: 'Explore our exquisite selection of fresh, hand-picked blooms. Select the perfect bouquet to convey your sentiments.',
      image: 'assets/onboarding2.png',
      pagenum: '2',
    ),
    OnboardingCustomWidget(
      label1: 'Enjoy our service',
      label2: 'Sit back and relax! Once you\'ve placed your order,we\'ll swiftly prepare it and ensure it reaches its destination,spreading joy and happiness.',
      image: 'assets/onboarding3.png',
      pagenum: '3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: onboardingPages,
      ),
       bottomSheet: Container(
      padding: const EdgeInsets.only(bottom: 20), 
        child: ElevatedButton(
          onPressed: () {
            if (currentIndex < onboardingPages.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              _completeOnboarding(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFBD8F97),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            currentIndex < onboardingPages.length - 1
                ? 'Next'  
                : 'Get Started',
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
