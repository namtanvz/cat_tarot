// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_element, unused_import, prefer_const_constructors_in_immutables

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../constants.dart';

// class DetailPage extends StatefulWidget {
//   final results;
//   DetailPage({this.results});

//   @override
//   State<StatefulWidget> createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kBackground,
//         elevation: 4.0,
//         centerTitle: true,
//         title: Text(
//           'Results',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: width / 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: Container(
//         color: kPrimaryColor,
//         height: height,
//         width: width,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//             physics: ClampingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                 _buildTitle('Overview', widget.results[0]['name']),
//                 _buildTitle('Work', widget.results[1]['name']),
//                 _buildTitle('Love', widget.results[2]['name']),
//                 _buildTitle('Finance', widget.results[3]['name']),
//               ],
//             )),
//       ),
//     );
//   }

//   Widget _buildTitle(title, value) {
//     return RichText(
//       text: TextSpan(children: [
//         TextSpan(
//           text: title + ':\t\t',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: width / 22.5,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         TextSpan(
//             text: value,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: width / 23.0,
//               fontWeight: FontWeight.w600,
//             )),
//       ]),
//     );
//   }

//   Widget _buildContent(List content) {
//     return Text(
//       content.join('\n\n'),
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: width / 25.0,
//         fontWeight: FontWeight.w400,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../constants.dart';
import 'model/global_card.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 4.0,
        centerTitle: true,
        title: Text(
          'Results',
          style: TextStyle(
            color: Colors.white,
            fontSize: width / 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        color: kBackground,
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                //! img 0
                _buildIMG('images/${global_Results[0]['img']}'),
                _buildTitle('Overview', global_Results[0]['name']),
                SizedBox(height: 16),
                _buildContent(global_Results[0]['meanings']['light']),
                SizedBox(height: 32),
                
                //! img 1
                _buildIMG('images/${global_Results[1]['img']}'),
                _buildTitle('Work', global_Results[1]['name']),
                SizedBox(height: 16),
                _buildContent(global_Results[1]['meanings']['light']),
                SizedBox(height: 32),

                //! img 2
                _buildIMG('images/${global_Results[2]['img']}'),
                _buildTitle('Love', global_Results[2]['name']),
                SizedBox(height: 16),
                _buildContent(global_Results[2]['meanings']['light']),
                SizedBox(height: 32),

                //! img 3
                _buildIMG('images/${global_Results[3]['img']}'),
                _buildTitle('Finance', global_Results[3]['name']),
                SizedBox(height: 16),
                _buildContent(global_Results[3]['meanings']['light']),
                SizedBox(height: 32),
              ],
            )),
      ),
    );
  }

  Widget _buildIMG(String img) {
    return Column(
      children: [
        Center(
          child: Container(
            height: height * .32,
            decoration: BoxDecoration(
              boxShadow: [ // Add a shadow
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              child: Image(
                image: AssetImage(img),
                fit: BoxFit.cover, // You can use BoxFit.cover to maintain the aspect ratio
              ),
            ),
          ),
        ),
        SizedBox(height: 24)
      ],
    );
  }  


  Widget _buildTitle(title, value) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: title + ':\t\t',
          style: TextStyle(
            color: Colors.white,
            fontSize: width / 22.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.white,
              fontSize: width / 23.0,
              fontWeight: FontWeight.bold,
            )),
      ]),
    );
  }

  Widget _buildContent(List content) {
    return Text(
      content.join('\n\n'),
      style: TextStyle(
        color: Colors.white,
        fontSize: width / 25.0,
        // fontWeight: FontWeight.w400,
      ),
    );
  }
}
