import 'package:flutter/material.dart';
import 'package:projegiris310/colors.dart';
import 'main.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* Frame Açılış Sayfası
    Autogenerated by FlutLab FTF Generator
  */
class Welcome extends StatefulWidget {
  const Welcome({Key key, this.analytics, this.observer}) : super(key:key);
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  int pageNumber = 1;
  int totalPage = 4;
  List <String> AppBarTitles = ["WELCOME", "INTRO", "PROFILES", "CONTENT"];
  List <String> PageTitles = ["Welcome to our project!", "Signup easily", "Create your profile", "Start meeting new people"];
  List <String> ImageLinks = ["assets/images/Mobile-Application.jpeg","assets/images/8981_f.jpg","assets/images/profileview.png","assets/images/posts.png"];
  List <String> Captions = ["New social media!", "Just use your existing accounts", "update your profile", "Share your posts!"];


  void nextPage() {
    setState(() {
      if(pageNumber < totalPage)
      {
        pageNumber += 1;
      }
      else
        {

          prefs.setInt("initScreen",1);
          Navigator.pushNamed(context, '/welcome2');
          print(initScreen);
        }

    });
  }

  void prevPage() {
    setState(() {
      if(pageNumber > 1)
      {
        pageNumber -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD1D1D6),
        title: Text(AppBarTitles[pageNumber-1],style: TextStyle(letterSpacing: -1,color: Color(0xFF757575),),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/22fa9f0a2460aedde0447f9a226564e2be88855e.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  PageTitles[pageNumber-1],
                  style: TextStyle(
                    color:AppColors.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(backgroundImage: AssetImage(ImageLinks[pageNumber-1]),radius: 150,),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Captions[pageNumber-1],
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 35,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    FloatingActionButton( child:
                    Text("prev",),
                      onPressed: prevPage,backgroundColor: AppColors.primary,),
                  ],
                ),
                SizedBox(width: 16,),
                Column(
                  children: [
                    Text(
                      "$pageNumber" + "/" + "$totalPage",
                      style: TextStyle(color: AppColors.primary, fontSize: 30, ),
                    ),
                  ],
                ),
                SizedBox(width: 16,),
                Column(
                  children: [
                    FloatingActionButton( child:
                    Text("next",),
                      onPressed: nextPage,backgroundColor: AppColors.primary,),
                  ],
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}