import 'package:flutter/material.dart';
import 'package:real_estate_app/view/home_screen.dart';
import 'package:real_estate_app/view/signUpScreen.dart';
import 'package:real_estate_app/view/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String screenRoute = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email ;
  late String password ;
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
                height: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Image.asset('assets/images/logo.png' ),
                    ),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 100, 0, 0),
                      child: Text('Welcome back !' ,
                        textAlign: TextAlign.left,
                        style:TextStyle(
                          color: Color(0xFF728B96),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ) ,),
                    ),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                      child: Text('sign in to your account' ,
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
                  SizedBox(height: 30,),

                  Container(
                    width: 300,
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
                      obscureText: true,
                      onChanged: (value){
                        password = value;
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
                  SizedBox(height: 50,),


                  MyButton(
                    color: Color(0xFFF27070),
                      title: 'Login ',
                      onPressed: ()async{
                    try{
                        final user =await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password);
                        if(user !=null){
                        Navigator.pushNamed(context, HomeScreen.screenRoute);
                        }
                        }catch(e){
                        print(e);
                    }

                      }),

                  SizedBox(height: 20,),

                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, SignUpScreen.screenRoute);
                  }, child: const Text(
                    "Doesn't have an account ? Sign up ",
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