import 'package:flower_shop/features/authentication/OnBoarding/onboardingCustomWidgit.dart';
import 'package:flutter/material.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnboardingCustomWidget(label1: 'Get your order', label2:'Sit back and relax! Once you\'ve placed your order,we\'ll swiftly prepare it and ensure it reaches its destination,spreading joy and happiness.',
 image: 'assets/onboarding3.png', pagenum: '3',),
      ),
    );
  }
}

