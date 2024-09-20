import 'package:flower_shop/features/authentication/OnBoarding/onboardingCustomWidgit.dart';
import 'package:flutter/material.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnboardingCustomWidget(label1: 'Order your flowers', label2:'Explore our exquisite selection of fresh, hand-picked blooms. Select the perfect bouquet to convey your sentiments.',
           image: 'assets/onboarding2.png', pagenum: '2',),
      ),
    );
  }
}

