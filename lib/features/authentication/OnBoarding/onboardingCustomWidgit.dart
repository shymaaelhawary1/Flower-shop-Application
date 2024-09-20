import 'package:flutter/material.dart';

class OnboardingCustomWidget extends StatelessWidget {
  const OnboardingCustomWidget({
    super.key,
    required this.label1,
    required this.label2,
    required this.image,
    required this.pagenum,
  });

  final String label1;
  final String label2;
  final String image;
  final String pagenum;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgroundImage.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          height: 670,
          width: 300,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 214, 212, 212).withOpacity(0.8),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 42,
                  color: Color(0xFFC4989F),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(image, height: 200, fit: BoxFit.contain),
              const SizedBox(height: 25),
              Text(
                label1,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                label2,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
            
            ],
          ),
        ),
      ),
    );
  }
}
