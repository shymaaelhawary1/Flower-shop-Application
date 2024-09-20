import 'package:flower_shop/features/authentication/forgetpassword/veiw/fogetPassScreen.dart';
import 'package:flower_shop/features/authentication/regestration/veiw/regestrationScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 29,
                      color: Color(0xFFC4989F),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Login with your data that you entered during your registration',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            hintText: 'User name',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFBD8F97),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFBD8F97),
                            ),
                            suffixIcon: Icon(Icons.visibility),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ForgetScreen();
                                }));
                              },
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Forgot Password?',
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
                            GestureDetector(
                              onTap: () {  
                                
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RegistrationScreen();
                                }));},
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Register',
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
                          ],
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBD8F97),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            fixedSize: const Size(200, 50),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
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
}
