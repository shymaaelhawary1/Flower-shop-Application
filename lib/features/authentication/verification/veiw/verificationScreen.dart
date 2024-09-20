import 'package:flower_shop/features/authentication/login/veiw/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFFC4989F),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please check your email to see the verification code',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'OTP code',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC4989F),
                    ),
                  ),
                  const SizedBox(height: 30),
                  PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.center,
                    appContext: context,
                    pastedTextStyle: const TextStyle(
                      color: Color(0xFFC4989F),
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: true,
                    obscuringCharacter: '*',
                    scrollPadding: const EdgeInsets.all(30),

                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(20),
                      fieldHeight: MediaQuery.of(context).size.width / 6,
                      fieldWidth: MediaQuery.of(context).size.width / 8,
                      activeFillColor: const Color(0xFFC4989F),
                      fieldOuterPadding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 30),
                      // inactiveFillColor: const Color.fromARGB(255, 187, 182, 165)
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    // controller: controller.pincodecontroller,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                    showverificationDialog(context); 

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
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: RichText(
                        text: const TextSpan(
                          text: 'Resend code?',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  
  Future<void> showverificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              Image.asset('assets/check-e-mail.png', height: 100),
              const SizedBox(height: 10),
              const Text(
                'Your Verification Success',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC4989F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text(
            'your verification success to your email. try to login with the new password that sent in your e-mail',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); 
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return  LoginScreen();
                          },
                        ),
                      );
                },
                child: const Text('OK', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        );
      },
    );
    return Future.value();
  }
}
