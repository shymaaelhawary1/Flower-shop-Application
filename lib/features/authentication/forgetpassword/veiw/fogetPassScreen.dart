import 'package:flower_shop/features/authentication/login/veiw/loginscreen.dart';
import 'package:flower_shop/features/authentication/verification/veiw/verificationScreen.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgroundImage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              height: 718,
              width: 300,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 214, 212, 212).withOpacity(0.8),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/loginimage.png'),
                    const SizedBox(height: 20),
                    const Text(
                      'forgot password',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFC4989F),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Enter your email to reset your password',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Form(
                      child: Column(children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'xxxxxxxxxx@gmail.com',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFBD8F97),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: RichText(
                          text: const TextSpan(
                            text: 'Back to Login',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFBD8F97),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFBD8F97),
                              decorationThickness: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const VerificationScreen();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBD8F97),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        fixedSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}