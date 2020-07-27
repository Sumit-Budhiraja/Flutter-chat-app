import 'dart:io';

import '..//styles/colors.dart';
import '..//styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './signInPage.dart';
class ChatHomePagePlatform extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  _signOut() async {
    await _firebaseAuth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: ChatHomePage(),
      );
    } else {
      return Scaffold(
        floatingActionButton: FloatingActionButton(child: Icon(Icons.cancel),onPressed: (){
          _signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage1()));

        },),
        backgroundColor: AppColors.darkGray,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.lightGray,
          title: Text("Chats"),
          actions: <Widget>[
            Icon(Icons.search),
            SizedBox(
              width: 10.0,
            )
          ],
        ),
        body: ChatHomePage(),
      );
    }
  }
}

class ChatHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 100.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top:5.0,right: 10.0, left: 10.0),
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text("Favourites"), Text("...")],
              ),
            ),
            Container(
              height: 75.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(radius: 24.0),
                    );
                  }),
            ),
          ],
        ),
      ),
      Divider(
        height: 2.0,
        color: Colors.grey,
      ),
      Expanded(
        child: ListView.builder(
        itemCount: 5,
          itemBuilder: (context,index){
        return InkWell(
          onTap: () {
            print("Pressed");
          },
          child:
          Container(
            height: 80.0,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 26.0,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Container(
                    height: 45.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Person Name",
                                style: AppTextStyles.chatName,
                              ),
                            ),
                            Container(
                              child: Text("1:04am"),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          child: Text("This is message Contaienr"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),)

    ]);
  }
}
