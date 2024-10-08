import 'package:flower_shop/features/authentication/OnBoarding/onboarding.dart';
import 'package:flower_shop/features/authentication/login/veiw/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
     MyApp(),
  
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: _isOnboardingComplete(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.data == true) {
            return LoginScreen();
          } else {
            return OnBoardingPageView();
          }
        },
      ),
    );
  }

  Future<bool> _isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_complete') ?? false;
  }
}
