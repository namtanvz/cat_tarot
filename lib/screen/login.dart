import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tarot/constants.dart';
import '../common/theme.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _headerHeight = 130.0;
    Key _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: size.height * 0.3,
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Username', 
                                      'Enter your user name'),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 
                                      'Enter your password'),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                  },
                                  child: const Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                      color: kPrimaryLightColor,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Sign In'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    //After successful login we will redirect to profile page. Let's create profile page now
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  const TextSpan(
                                    text: "Don\'t have an account? ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => const SignUp()));
                                      },
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryLightColor),
                                  ),
                                ]
                              )
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


