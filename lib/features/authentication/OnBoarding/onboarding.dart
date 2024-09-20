import 'package:flower_shop/features/authentication/OnBoarding/onboardingCustomWidgit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key,required void Function() onComplete});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnboardingCustomWidget(
          label1: 'Choose your delivery location', 
          label2:'Tell us where you\'d like \nthe flowers to be delivered,\n and we\'ll make sure they reach the right place, right on time.',
          image: 'assets/onboarding1.png',pagenum: '1'),
      ),
    );
  }
  
    Future<void> _completeOnboarding() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_complete', true);
  }
}

