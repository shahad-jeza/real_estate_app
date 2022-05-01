import 'package:flutter/material.dart';
import 'package:real_estate_app/view/WelcomeScreen.dart';
import 'package:real_estate_app/view/favorite_screen.dart';
import 'package:real_estate_app/view/home_screen.dart';
import 'package:real_estate_app/view/login_screen.dart';
import 'package:real_estate_app/view/profile_screen.dart';
import 'package:real_estate_app/view/signUpScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'real estate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'IBM_Plex_Sans'
      ),
      //home: LoginScreen(),
      initialRoute: WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context)=> WelcomeScreen(),
        LoginScreen.screenRoute : (context)=>LoginScreen(),
        SignUpScreen.screenRoute : (context)=> SignUpScreen(),
        HomeScreen.screenRoute : (context)=> HomeScreen(),
        FavoritesScreen.screenRoute : (context)=> FavoritesScreen(),
        ProfileScreen.screenRoute : (context) => ProfileScreen(),
      },
    );
  }
}
