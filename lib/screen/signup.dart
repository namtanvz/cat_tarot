// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

import '../common/theme.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textFieldKey = GlobalKey();
    // ignore: no_leading_underscores_for_local_identifiers
    final _controller = TextEditingController();

    var headerHeight = 50.0;
    Key SingUpKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;

    DateTime _selectedDate = DateTime.now(); // <-- new line

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: headerHeight,
          ),
          SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        height: 200,
                      ),
                      const SizedBox(height: 15.0),
                      const Text(
                        'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: SingUpKey,
                          child: Column(
                            children: [
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: ThemeHelper().textInputDecoration(
                                    'Email',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextField(
                                  decoration: ThemeHelper().textInputDecoration(
                                    'Username',
                                  ),
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
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: SizedBox(
                                  // width: 200,
                                  height: 50.0,
                                  child: TextField(
                                    key: textFieldKey,
                                    controller: _controller,
                                    readOnly: true,
                                    textAlign: TextAlign.start,
                                    decoration: const InputDecoration(
                                      hintText: "      Your Birthday",
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.today),
                                    ),
                                    onTap: () async {
                                      final pickedDate =
                                          await showWebDatePicker(
                                        context: textFieldKey.currentContext!,
                                        initialDate: _selectedDate,
                                        firstDate: DateTime.now()
                                            .add(const Duration(days: -14000)),
                                        lastDate: DateTime.now()
                                            .add(const Duration(days: 14000)),
                                        width: 300,
                                      );
                                      if (pickedDate != null) {
                                        _selectedDate = pickedDate;
                                        _controller.text =
                                            pickedDate.toString().split(' ')[0];
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 70.0),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                width: 200,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(29),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 40,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Login()));
                                      },
                                      child: const Text('Register')),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ))),
        ],
      )),
    );
  }
}
