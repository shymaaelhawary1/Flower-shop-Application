import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_shop/core/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flower_shop/features/authentication/login/veiw/loginscreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? pass;

  String? mail;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isLoading = false;
 bool _isObscure = true;
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
                                validator: MyValidation().mailValidate,
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
                              const SizedBox(height: 10),
                              TextFormField(
                                validator: MyValidation().passwordValidate,
                                onChanged: (password) {
                                  pass = password;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFBD8F97),
                                  ),
                                  suffixIcon: IconButton( icon:  Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  _isObscure = !_isObscure;
                                },)
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
               if (formkey.currentState != null && formkey.currentState!.validate()) {   
                                             isLoading = true;
                                setState((){

                                });
                                try {
                                  await registerFirebase();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'your registration is successful'),
                                    ),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'The password provided is too weak.'),
                                      ),
                                    );
                                  } else if (e.code == 'email-already-in-use') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'The account already exists for that email.'),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'An error occurred during registration.'),
                                    ),
                                  );
                                  isLoading = false;
                                  setState((){
                                  
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
                              'Sign Up',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFBD8F97),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              fixedSize: const Size(200, 50),
                            ),
                            child: const Text(
                              'Facebook',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFBD8F97),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              fixedSize: const Size(200, 50),
                            ),
                            child: const Text(
                              'Google',
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

  Future<void> registerFirebase() async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: mail!,
      password: pass!,
    );
  }
}
