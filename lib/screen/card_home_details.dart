// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_element, unused_import, prefer_const_constructors_in_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:tarot/screen/navbar.dart';

import '../constants.dart';
import 'card_info.dart';
import 'model/global_card.dart';
import 'model/home_card.dart';

class homeDetailPage extends StatefulWidget {
  const homeDetailPage({super.key});

  @override
  _homeDetailPageState createState() => _homeDetailPageState();
}

class _homeDetailPageState extends State<homeDetailPage> {
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
          '${home_Results[0]['name']}',
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
                SizedBox(height: 32),
                //! img 0
                _buildIMG('images/${home_Results[0]['img']}'),
                _buildTitle('Name', home_Results[0]['name']),
                SizedBox(height: 16),
                Text(
                  'Fortune Telling',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                _buildContent(home_Results[0]['fortune_telling']),
                SizedBox(height: 16),
                Text(
                  'Meaning Light',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                _buildContent(home_Results[0]['meanings']['light']),
                SizedBox(height: 16),
                Text(
                  'Meaning Shadow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                _buildContent(home_Results[0]['meanings']['shadow']),
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
              boxShadow: [
                // Add a shadow
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
                fit: BoxFit
                    .cover, // You can use BoxFit.cover to maintain the aspect ratio
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
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              // fontWeight: FontWeight.bold,
            )),
      ]),
    );
  }

  Widget _buildContent(List content) {
    return Text(
      content.join('\n'),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        // fontWeight: FontWeight.w400,
      ),
    );
  }
}
