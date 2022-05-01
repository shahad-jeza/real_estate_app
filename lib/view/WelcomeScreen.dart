import 'package:flutter/material.dart';
import 'package:real_estate_app/view/login_screen.dart';
import 'package:real_estate_app/view/widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Image.asset('assets/images/welcome_image.png'),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                child: Text('Find The place of Your dreams !' ,
                  style:TextStyle(
                    color: Color(0xFF0C7198),
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ) ,),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 0, 50),
                child: Text('look for your dream home quickly and precisely with us' ,
                  style:TextStyle(
                    color: Color(0xFF0C7198),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ) ,),
              ),

               MyButton(
                 color:Color(0xFFF27070) ,
                 title: 'Get Started',
                 onPressed: (){
                   Navigator.pushNamed(context, LoginScreen.screenRoute);
                 },
               )
            ],
          ),
        ],
      ),
    );
  }
}


