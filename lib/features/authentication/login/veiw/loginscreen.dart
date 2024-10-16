import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_shop/core/utils/validation.dart';
import 'package:flower_shop/features/authentication/forgetpassword/veiw/fogetPassScreen.dart';
import 'package:flower_shop/features/authentication/regestration/veiw/regestrationScreen.dart';
import 'package:flower_shop/features/dashboard/home/veiw/home.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  String? pass;
  String? mail;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: MyValidation().mailValidate,
                            onChanged: (email) {
                              mail = email;
                            },
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
                            validator: MyValidation().passwordValidate,
                            onChanged: (password) {
                              pass = password;
                            },
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFFBD8F97),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
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
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFBD8F97),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFBD8F97),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RegistrationScreen();
                                  }));
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFBD8F97),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFBD8F97),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await loginFirebase();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Your login is successful'),
                                    ),
                                  );
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Home();
                                  }));
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'No user found for this e-mail. Please register first.'),
                                      ),
                                    );
                                  } else if (e.code == 'wrong-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Wrong password provided for that user.'),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'An error occurred during login.'),
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFBD8F97),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              fixedSize: const Size(200, 50),
                            ),
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
      ),
    );
  }

  Future<void> loginFirebase() async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: mail!,
      password: pass!,
    );
  }
}
