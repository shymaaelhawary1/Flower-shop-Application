import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flower_shop/features/authentication/login/veiw/loginscreen.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController usernameController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  String? pass;
  String? mail;

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
                  const SizedBox(height: 5),
                  const Text(
                    'Create a new account',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFC4989F),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Fill in your details to create a new account and start sending beautiful flowers to your loved ones',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (email) {
                            mail = email;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email address',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFBD8F97),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 5),
                        TextFormField(
                          onChanged: (password) {
                            pass = password;
                          },
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
                        const SizedBox(height: 5),
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
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              UserCredential credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: mail!,
                                password: pass!,
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBD8F97),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            fixedSize: const Size(200, 50),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 2,
                                color: Color(0xFFBD8F97),
                                indent: 5,
                                endIndent: 10,
                              ),
                            ),
                            Text(
                              'or Sign up with',
                              style: TextStyle(color: Color(0xFFBD8F97)),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 2,
                                color: Color(0xFFBD8F97),
                                indent: 10,
                                endIndent: 5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add Facebook sign-up functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBD8F97),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            fixedSize: const Size(200, 50),
                          ),
                          child: const Text(
                            'Facebook',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add Google sign-up functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBD8F97),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            fixedSize: const Size(200, 50),
                          ),
                          child: const Text(
                            'Google',
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
