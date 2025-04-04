import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../pagesprofile/editprofile.dart';
import '../pagesprofile/helpcenter.dart';
import '../pagesprofile/lanuage.dart';
import '../pagesprofile/notifaction.dart';
import '../pagesprofile/security.dart';
import '../pagesprofile/termofcondition.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        // appBar: AppBar(
        //   leading: Icon(Icons.arrow_back, color: Colors.black),
        //   title: Text("Profile", style: TextStyle(color: Colors.black)),
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 15),
                Image.asset('asset/img_15.png',width: 24,height: 24,),
                SizedBox(width: 115),
                Text("Profile", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),
            SizedBox(height: 15),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("asset/img_14.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.camera_alt, color: Colors.teal),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text("Laila",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("laila.ali23@gmail.com", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Color(0xff12867A),size: 24,),
                        SizedBox(width: 8,),
                        Text('Edit Profile',
                          style: TextStyle(color: Color(0xff12867A),fontSize: 16,fontWeight: FontWeight.w600),),
                        Spacer(),
                        GestureDetector(

                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 600),
                                    reverseDuration: Duration(milliseconds: 300),
                                    type: PageTransitionType.rightToLeft,
                                    child: EditProfileScreen(),
                                  ));


                            },

                            child: Icon(Icons.arrow_forward_ios,size: 18,))
                      ],
                    ),
                    SizedBox(height: 24,),
                    Row(
                      children: [
                        Icon(Icons.notifications, color: Color(0xff12867A),size: 24,),
                        SizedBox(width: 8,),
                        Text('Notifications',
                          style: TextStyle(color: Color(0xff12867A),fontSize: 16,fontWeight: FontWeight.w600),),
                        Spacer(),
                        GestureDetector(

                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 600),
                                    reverseDuration: Duration(milliseconds: 300),
                                    type: PageTransitionType.leftToRightWithFade,
                                    child: NotificationScreen(),
                                  ));


                            },

                            child: Icon(Icons.arrow_forward_ios,size: 18,))
                      ],
                    ),
                    SizedBox(height: 24,),
                    Row(
                      children: [
                        Icon(Icons.security, color: Color(0xff12867A),size: 24,),
                        SizedBox(width: 8,),
                        Text('Security',
                          style: TextStyle(color: Color(0xff12867A),fontSize: 16,fontWeight: FontWeight.w600),),
                        Spacer(),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 600),
                                    reverseDuration: Duration(milliseconds: 300),
                                    type: PageTransitionType.leftToRightWithFade,
                                    child: SecurityPrivacyScreen(),
                                  ));


                            },

                            child: Icon(Icons.arrow_forward_ios,size: 18,))
                      ],
                    ),

                    SizedBox(height: 24,),
                    Row(
                      children: [
                        //buildProfileOption(Icons.language, "Language", trailingText: "English (US)"),
                        Icon(Icons.language, color: Color(0xff12867A),size: 24,),
                        SizedBox(width: 8,),
                        Text('Language',
                          style: TextStyle(color: Color(0xff12867A),fontSize: 16,fontWeight: FontWeight.w600),),
                        Spacer(),
                        Text('English (US)',style: TextStyle(fontSize: 12),),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 600),
                                    reverseDuration: Duration(milliseconds: 300),
                                    type: PageTransitionType.leftToRightWithFade,
                                    child: LanguageScreen(),
                                  ));


                            },
                            child: Icon(Icons.arrow_forward_ios,size: 18,))
                      ],
                    ),
                    SizedBox(height: 24,),
                    Row(
                      children: [
                        Icon(Icons.info, color: Color(0xff12867A),size: 24,),
                        SizedBox(width: 8,),
                        Text('Terms & Conditions',
                          style: TextStyle(color: Color(0xff12867A),fontSize: 16,fontWeight: FontWeight.w600),),
                        Spacer(),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 600),
                                    reverseDuration: Duration(milliseconds: 300),
                                    type: PageTransitionType.leftToRightWithFade,
                                    child: TermsConditionsScreen(),
                                  ));


                            },



                            child: Icon(Icons.arrow_forward_ios,size: 18,))
                      ],
                    ),
                    SizedBox(height: 24,),
                    Row(
                      children: [
                        Icon(Icons.help, color: Color(0xff12867A),size: 24,),
                        SizedBox(width: 8,),
                        Text("Help Center",
                          style: TextStyle(color: Color(0xff12867A),fontSize: 16,fontWeight: FontWeight.w600),),
                        Spacer(),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 600),
                                    reverseDuration: Duration(milliseconds: 300),
                                    type: PageTransitionType.leftToRightWithFade,
                                    child: FAQScreen(),
                                  ));


                            },


                            child: Icon(Icons.arrow_forward_ios,size: 18,))
                      ],
                    ),
                    SizedBox(height: 24,),
                    Row(
                      children: [
                        Icon(Icons.logout, color: Color(0xff12867A),size: 24,),
                        SizedBox(width: 8,),
                        Text("Logout",
                          style: TextStyle(color: Color(0xff12867A),fontSize: 16,fontWeight: FontWeight.w600),),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,size: 18,)
                      ],
                    ),

                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

















