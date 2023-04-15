// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_constructors, body_might_complete_normally_nullable, unused_field, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tarot/screen/navbar.dart';

import '../common/theme.dart';
import '../constants.dart';
import 'model/profile.dart';
import 'welcome/welcome_screen.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  Profile profile = Profile();
  final _controller_email = TextEditingController();
  final _controller_name = TextEditingController();
  final editKey = GlobalKey<FormState>();

  Future<Profile?> readUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final docUser = FirebaseFirestore.instance.collection('Users').doc(uid);
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return Profile.fromJson(snapshot.data()!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Navbar()));
          },
        ),
        backgroundColor: kBackground,
        elevation: 4.0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: width / 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder<Profile?>(
          future: readUser(),
          builder: (context, snapshot) {
            final users = snapshot.data!;
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              profile.email = users.email;
              profile.fullname = users.fullname;
              profile.password = users.password;
              profile.birthday = users.birthday;
              print(
                  'email : ${profile.email}\n fullname : ${profile.fullname}\n password : ${profile.password}\n birthday : ${profile.birthday}');
              var size = MediaQuery.of(context).size;
              return Scaffold(
                  body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: 16,
                  ),
                  SafeArea(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: size.height * 0.3,
                        ),
                        SizedBox(height: 24),
                        Form(
                            key: editKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16),
                                Text(
                                  'Your Name',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShadow(),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _controller_name,
                                          validator: RequiredValidator(
                                              errorText:
                                                  'Please enter Full Name'),
                                          onSaved: (_controller_name) {
                                            profile.fullname = _controller_name;
                                          },
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  '${profile.fullname}'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 120),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(32),
                                  // decoration: ThemeHelper().buttonBoxDecoration(context),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 32),
                                          backgroundColor: kPrimaryColor),
                                      onPressed: () async {
                                        editKey.currentState?.save();
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
                                                  'Successfully Updated',
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
                                        final uid = FirebaseAuth
                                            .instance.currentUser?.uid;
                                        final docUser = FirebaseFirestore
                                            .instance
                                            .collection('Users')
                                            .doc(uid);
                                        docUser.update({
                                          'fullname': '${profile.fullname}',
                                        });
                                        editKey.currentState?.reset();
                                      },
                                      child: Text('Updated Profile',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ))
                ]),
              ));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
