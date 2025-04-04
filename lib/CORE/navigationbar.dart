


import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/CORE/profile.dart';


import '../home.dart';
import '../mainpage/ChatAI.dart';

class buttonbar extends StatefulWidget {
  buttonbar({super.key});

  @override
  State<buttonbar> createState() => _buttonbarState();
}

class _buttonbarState extends State<buttonbar> {
  List SCREAN=[


    Home(),
    Chatai(),
    profile(),


  ];

  int _page = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        //key: _bottomNavigationKey,
        index: _page,
        items: [
          CurvedNavigationBarItem(

              child: Icon(Icons.home,color: Colors.white,size: 30,),
              label: '',
              labelStyle: TextStyle(color: Colors.white)

          ),
          CurvedNavigationBarItem(
              child: Icon(Icons.message_outlined,color: Colors.white,size: 30,),
              label: '',
              labelStyle: TextStyle(color: Colors.white)
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person,color: Colors.white,size: 30,),
            label: '',
          ),

        ],
        color: Color(0xff12867A),
        buttonBackgroundColor: Color(0xff12867A),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page=index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body:SCREAN[_page],
    );
  }
}
