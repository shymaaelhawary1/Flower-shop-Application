import 'package:firebase_core/firebase_core.dart';
import 'package:flower_shop/features/dashboard/Cart/controller/cart/cart_cubit.dart';
import 'package:flower_shop/features/dashboard/favourite/controller/favourite/favourite_cubit.dart';
import 'package:flower_shop/features/authentication/OnBoarding/onboarding.dart';
import 'package:flower_shop/features/authentication/login/veiw/loginscreen.dart';
import 'package:flower_shop/features/dashboard/home/veiw/home.dart';
import 'package:flower_shop/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/dashboard/CategoryPage/veiw/CategoryPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            return Home();
          } else {
            return const OnBoardingPageView();
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
