// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, prefer_const_constructors, dead_code, unnecessary_string_escapes, unused_catch_clause, empty_catches, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tarot/constants.dart';
import 'package:tarot/screen/welcome/welcome_screen.dart';
import '../common/theme.dart';
import 'model/profile.dart';
import 'signup.dart';
import 'homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _headerHeight = 75.0;
  final LoginKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final _controller_email = TextEditingController();
  final _controller_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //* error checker
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('${snapshot.error}'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()));
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: _headerHeight,
                    ),
                    SafeArea(
                        child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: size.height * 0.3,
                          ),
                          const SizedBox(height: 30),
                          Form(
                            key: LoginKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //* Email
                                Container(
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShadow(),
                                  child: TextFormField(
                                    controller: _controller_email,
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: 'Please enter Email'),
                                      EmailValidator(
                                          errorText: 'Wrong Email format')
                                    ]),
                                    onSaved: (_controller_email) {
                                      profile.email = _controller_email;
                                    },
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'Email', 'Enter Your Email'),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                //* password
                                Container(
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShadow(),
                                  child: TextFormField(
                                    controller: _controller_password,
                                    validator: RequiredValidator(
                                        errorText: 'Please enter password'),
                                    obscureText: true,
                                    onSaved: (_controller_password) {
                                      profile.password = _controller_password;
                                    },
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'Password', 'Enter Your password'),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                //! Forget password
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 20),
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
                                //* sign in button
                                Container(
                                  decoration: ThemeHelper()
                                      .buttonBoxDecoration(context),
                                  child: ElevatedButton(
                                    style: ThemeHelper().buttonStyle(),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 10, 40, 10),
                                      child: Text(
                                        'Sign In'.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () async {
                                      //After successful login we will redirect to profile page. Let's create profile page now
                                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                      if (LoginKey.currentState!.validate()) {
                                        LoginKey.currentState!.save();
                                        try {
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: '${profile.email}',
                                                  password:
                                                      '${profile.password}');
                                          var snackBar = SnackBar(
                                            content: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Successfully Login',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          LoginKey.currentState!.reset();
                                          await Navigator.pushReplacement(
                                              context, MaterialPageRoute(
                                                  builder: (context) {
                                            return Homepage();
                                          }));
                                        } on FirebaseAuthException catch (e) {
                                          var snackBar = SnackBar(
                                            content: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${e.message}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      }
                                    },
                                  ),
                                ),
                                //* Don't have an account?
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: Text.rich(TextSpan(children: [
                                    const TextSpan(
                                      text: "Don\ 't have an account? ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUp()));
                                        },
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryLightColor),
                                    ),
                                  ])),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
