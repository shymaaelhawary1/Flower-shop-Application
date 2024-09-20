import 'package:flower_shop/features/authentication/OnBoarding/onboardingCustomWidgit.dart';
import 'package:flutter/material.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnboardingCustomWidget(label1: 'Get your order', label2:'',
 image: 'assets/onboarding3.png', pagenum: '3',),
      ),
    );
  }
}

