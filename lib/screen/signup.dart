// ignore_for_file: duplicate_import, no_leading_underscores_for_local_identifiers, avoid_print, prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_null_comparison, unused_local_variable, unused_field, use_build_context_synchronously, await_only_futures, non_constant_identifier_names, unused_label, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tarot/screen/model/profile.dart';

import '../common/theme.dart';
import 'login.dart';
import 'model/profile.dart';
import 'welcome/welcome_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signUpKey = GlobalKey<FormState>();
  Profile profile = Profile();
  DateTime _dateTime = DateTime.now();
  final textFieldKey = GlobalKey();
  final _controller_birthday = TextEditingController();
  final _controller_email = TextEditingController();
  final _controller_name = TextEditingController();
  final _controller_password = TextEditingController();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  @override
  Widget build(BuildContext context) {
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
                            builder: (context) =>
                                const WelcomeScreen()));
                  },
                  ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                  ),
              body: SingleChildScrollView(
                child: Column(children: [
                  SafeArea(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 25.0),
                        Form(
                            key: signUpKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //* E-mail
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
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (_controller_email) {
                                      profile.email = _controller_email;
                                    },
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Email'),
                                  ),
                                ),
                                const SizedBox(height: 25.0),
                                //* Username
                                Container(
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShadow(),
                                  child: TextFormField(
                                    controller: _controller_name,
                                    validator: RequiredValidator(
                                        errorText: 'Please enter Full Name'),
                                    onSaved: (_controller_name) {
                                      profile.fullname = _controller_name;
                                    },
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Full Name'),
                                  ),
                                ),
                                const SizedBox(height: 25.0),
                                //* Password
                                Container(
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShadow(),
                                  child: TextFormField(
                                    controller: _controller_password,
                                    validator: RequiredValidator(
                                        errorText: 'Please enter Password'),
                                    obscureText: true,
                                    onSaved: (_controller_password) {
                                      profile.password = _controller_password;
                                    },
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Password'),
                                  ),
                                ),
                                const SizedBox(height: 25.0),
                                //* BirthDay
                                Container(
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShadow(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              validator: RequiredValidator(
                                                  errorText:
                                                      'Please enter your birthday'),
                                              key: textFieldKey,
                                              controller: _controller_birthday,
                                              textAlign: TextAlign.start,
                                              decoration: InputDecoration(
                                                hintText: '   Your BirthDay',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 10.0),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              readOnly: true,
                                              onSaved: (_controller_birthday) {
                                                profile.birthday =
                                                    _controller_birthday;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          MaterialButton(
                                            onPressed: () async {
                                              final date = await pickDate();
                                              if (date == null) return;
                                              setState(() => _dateTime = date);
                                              _controller_birthday.text =
                                                  '   ${date.day}/${date.month}/${date.year}';
                                            },
                                            child: Text(
                                              'Select',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            color: Color.fromARGB(
                                                255, 88, 47, 125),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                //* register button
                                const SizedBox(height: 60.0),
                                Container(
                                  decoration: ThemeHelper()
                                      .buttonBoxDecoration(context),
                                  width: 200,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(29),
                                    child: ElevatedButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 20,
                                            horizontal: 40,
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (signUpKey.currentState!
                                              .validate()) {
                                            signUpKey.currentState!.save();
                                            try {
                                              await FirebaseAuth.instance
                                                  .createUserWithEmailAndPassword(
                                                email: profile.email.toString(),
                                                password:
                                                    profile.password.toString(),
                                              );
                                              final uid = FirebaseAuth.instance.currentUser?.uid;
                                              final docUser = FirebaseFirestore
                                                  .instance
                                                  .collection('Users')
                                                  .doc('$uid');
                                              await docUser
                                                  .set(profile.toJson());
                                              var snackBar = SnackBar(
                                                content: Container(
                                                  padding: EdgeInsets.all(16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Successfully created',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                              signUpKey.currentState!.reset();
                                              await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Login()));
                                            } on FirebaseAuthException catch (e) {
                                              // print(e.code);
                                              // print(e.message);
                                              var snackBar = SnackBar(
                                                content: Container(
                                                  padding: EdgeInsets.all(16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
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
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          }
                                        },
                                        child: const Text('Register')),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ))
                ]),
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
