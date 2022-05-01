
import 'package:flutter/material.dart';
import 'package:real_estate_app/model/appUser.dart';

import 'package:real_estate_app/view/home_screen.dart';
import 'package:real_estate_app/view/widgets/my_button.dart';

import 'package:real_estate_app/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpScreen extends StatefulWidget {
  static const String screenRoute = 'signUp_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late appUser user;
  final _auth = FirebaseAuth.instance;
  
  late String email ;
  late String userName;
  late String password;
  late String userType;
  late String phoneNumber;

  String dropdownvalue = 'Costumer : look for properties';
  var items = [
    'Costumer : look for properties',
    'owner : sell properties',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipPath(
              child: Container(
                color: Color(0xFFDAE7EC),
                height: 375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Image.asset('assets/images/logo.png' ),
                    ),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Text('nice to meet you !' ,
                        textAlign: TextAlign.left,
                        style:TextStyle(
                          color: Color(0xFF728B96),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ) ,),
                    ),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                      child: Text('create a new account' ,
                        textAlign: TextAlign.left,
                        style:TextStyle(
                          color: Color(0xFF728B96),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ) ,),
                    ),

                  ],
                  
                ),
              ),
              clipper: CustomClipPath(),
            ),


            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 20,),

                    Container(
                      width: 300,
                      child: TextField(
                        onChanged: (value){
                          userName = value ;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: Colors.black12,
                          hintText: 'user name',
                          hintStyle: TextStyle(color: Colors.black26 , fontWeight: FontWeight.normal),
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ) ,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(50)) ,
                            borderSide: BorderSide(color: Colors.black26 , width: 1 ) ,
                          ),
                          focusedBorder:OutlineInputBorder(
                              borderRadius:BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(color: Colors.blueAccent , width: 2),
                          ),
                        ),

                      ),
                    ),
                  SizedBox(height: 10,),


                  Container(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        email = value ;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Colors.black12,
                        hintText: 'Email address',
                        hintStyle: TextStyle(color: Colors.black26 , fontWeight: FontWeight.normal),
                        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ) ,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(50)) ,
                          borderSide: BorderSide(color: Colors.black26 , width: 1 ) ,
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Colors.blueAccent , width: 2),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    width: 300,
                    child: TextField(
                      onChanged: (value){
                        phoneNumber = value ;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        prefixIconColor: Colors.black12,
                        hintText: 'phone number',
                        hintStyle: TextStyle(color: Colors.black26 , fontWeight: FontWeight.normal),
                        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ) ,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(50)) ,
                          borderSide: BorderSide(color: Colors.black26 , width: 1 ) ,
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Colors.blueAccent , width: 2),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    width: 300,
                    child: TextField(
                      obscureText: true,
                      onChanged: (value){
                        password = value ;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: Colors.black12,
                        hintText: 'password',
                        hintStyle: TextStyle(color: Colors.black26 , fontWeight: FontWeight.normal),
                        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ) ,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(50)) ,
                          borderSide: BorderSide(color: Colors.black26 , width: 1 ) ,
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Colors.blueAccent , width: 2),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 20,),

                  DropdownButton(
                    style: const TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),

                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        userType = dropdownvalue ;

                      });
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  
                  MyButton(
                    color: Color(0xFFF27070),
                      title: 'Sign up',
                      onPressed: () async{
                    try{
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password);
                      Navigator.pushNamed(context,HomeScreen.screenRoute);
                    } catch(e){
                      print(e);
                    };

                    user.addUser();

                      }),

                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.screenRoute);
                  }, child: const Text(
    'already have an account ? login ',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    ),),)
                      ],
              ),
            )
          ],

        ),
      ),

    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
        - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height,
        size.width, size.height-30);
    path.lineTo(size.width, 0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}