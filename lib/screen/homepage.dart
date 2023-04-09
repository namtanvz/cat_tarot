// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unnecessary_const, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_local_variable, unused_label, avoid_print, await_only_futures, avoid_function_literals_in_foreach_calls, unused_field, body_might_complete_normally_nullable

// import 'package:flutter/material.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<Homepage> {
//   final _headerHeight = 130.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: _headerHeight,
//               child: Center(
//                 child: Text("Homepage",
//                 style: TextStyle(
//                   fontSize: 40,
//                   color: Colors.white,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tarot/screen/navbar.dart';

import 'model/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _headerHeight = 100.0;
  Profile profile = Profile();

  Future<Profile?> readUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final docUser = FirebaseFirestore.instance.collection('Users').doc(uid);
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return Profile.fromJson(snapshot.data()!);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<Profile?>(
            future: readUser(),
            builder: (context, snapshot) {
              final user = snapshot.data!;
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                profile.email = user.email;
                profile.fullname = user.fullname;
                profile.password = user.password;
                profile.birthday = user.birthday;
                print(
                    'email : ${profile.email}\n fullname : ${profile.fullname}\n password : ${profile.password}\n birthday : ${profile.birthday}');
                var size = MediaQuery.of(context).size;
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: _headerHeight,
                        ),
                        SafeArea(
                          child: Container(
                            // padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            // margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: size.height * 0.45,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Welcome ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  TextSpan(
                                      text: '${profile.fullname}',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                ]))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );
}



// Widget buildUser(Profile profile) => ListTile(
//       leading: Text('${profile.birthday}'),
//       title: Text('${profile.fullname}'),
//       subtitle: Text('${profile.email}'),
//       trailing: Text('${profile.password}'),
//     );


// @override
  // Widget build(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   // userID.get();
  //   // userID.snapshots();

  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Container(
  //             height: _headerHeight,
  //           ),
  //           SafeArea(
  //             child: Container(
  //               // padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
  //               // margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
  //               child: Column(
  //                 children: [
  //                   Image.asset(
  //                     'assets/images/logo.png',
  //                     height: size.height * 0.45,
  //                   ),
  //                   const SizedBox(
  //                     height: 30,
  //                   ),
  //                   Text.rich(TextSpan(children: [
  //                     TextSpan(
  //                         text: "Welcome ",
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                         )),
  //                     TextSpan(
  //                         text: 'full name',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                         ))
  //                   ]))
  //                 ],
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }





// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tarot/screen/navbar.dart';

// import 'model/profile.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);

//   @override
//   _HomepageState createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   final _headerHeight = 100.0;
//   Profile profile = Profile();

//   Future<Profile?> readUser() async {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//     final docUser = FirebaseFirestore.instance.collection('Users').doc(uid);
//     final snapshot = await docUser.get();
//     if (snapshot.exists) {
//       return Profile.fromJson(snapshot.data()!);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<Profile?>(
//         future: readUser(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           } else if (snapshot.hasData) {
//             final user = snapshot.data!;
//             profile.email = user.email;
//             profile.fullname = user.fullname;
//             profile.password = user.password;
//             profile.birthday = user.birthday;
//             print(
//                 'email : ${profile.email}\n fullname : ${profile.fullname}\n password : ${profile.password}\n birthday : ${profile.birthday}');
//             var size = MediaQuery.of(context).size;
//             return SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     height: _headerHeight,
//                   ),
//                   SafeArea(
//                     child: Container(
//                       child: Column(
//                         children: [
//                           Image.asset(
//                             'assets/images/logo.png',
//                             height: size.height * 0.45,
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           Text.rich(
//                             TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "Welcome ",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: '${profile.fullname}',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
