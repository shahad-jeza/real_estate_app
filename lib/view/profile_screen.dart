import 'dart:core';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_app/model/Property.dart';
import 'package:real_estate_app/view/WelcomeScreen.dart';
import 'package:real_estate_app/view/widgets/myAppBar.dart';
import 'package:real_estate_app/view/widgets/my_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';


class ProfileScreen extends StatefulWidget {
  static const String screenRoute = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User signedInUser;
  late Property property;

  String dropdownvalue = 'apartment';
  var items = [
    'apartment',
    'villa',
    'land',
    'building'
  ];

  late  double _price ;
  late double _space ;
  late String _location;
   int _numberOfBedRooms =1 ;
   int _numberOfBathRooms=1 ;
   int _numberOfLivingRooms=1 ;
  late String _typeOfProperty;




  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final myUser = _auth.currentUser;
      if (myUser != null) {
        signedInUser = myUser;
      }
    } catch (e) {
      print(e);
    }
  }

  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }




  getUserInfo(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top:Radius.circular(30))
              ),
              builder: (context) => Container(
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

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
                          _typeOfProperty = dropdownvalue ;
                        });
                      },
                    ),

                    SizedBox(height: 10,),


                    Container(
                      width: 300,
                      child: TextField(
                        onChanged: (value){
                          _location =value ;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter property location ',
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
                          _price = double.parse(value) ;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter property price ',
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
                          _space = double.parse(value) ;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter property space',
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('number of bed rooms : ' ,
                        style: TextStyle(
                          color: Colors.black38
                        ),),

                        DropdownButton<int>(
                          menuMaxHeight: 150.0,
                          style: const TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),

                          // Initial Value
                          value: _numberOfBedRooms,
                          hint:Text('0'),

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: <int>[1,2,3,4,5,6,7,8,9,10,11,12,13,14].map((int value){
                            return new DropdownMenuItem<int>(
                              value: value,
                              child:new Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (newVal){
                            setState(() {
                              _numberOfBedRooms = newVal!;
                            });
                          },
                        ),

                      ],
                    ),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('number of bath rooms : ' ,
                          style: TextStyle(
                              color: Colors.black38
                          ),),

                        DropdownButton<int>(
                          menuMaxHeight: 150.0,
                          style: const TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),

                          // Initial Value
                          value: _numberOfBathRooms,
                          hint:Text('0'),

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: <int>[1,2,3,4,5,6,7,8,9,10,11,12,13,14].map((int value){
                            return new DropdownMenuItem<int>(
                              value: value,
                              child:new Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (newVal){
                            setState(() {
                              _numberOfBathRooms = newVal!;
                            });
                          },
                        ),

                      ],
                    ),



                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('number of living rooms : ' ,
                          style: TextStyle(
                              color: Colors.black38
                          ),),

                        DropdownButton<int>(
                          menuMaxHeight: 150.0,
                          style: const TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),

                          // Initial Value
                          value: _numberOfLivingRooms,
                          hint:Text('0'),

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: <int>[1,2,3,4,5,6,7,8,9,10,11,12,13,14].map((int value){
                            return new DropdownMenuItem<int>(
                              value: value,
                              child:new Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (newVal){
                            setState(() {
                              _numberOfLivingRooms = newVal!;
                            });
                          },
                        ),

                      ],
                    ),

                    SizedBox(height: 10,),

                    TextButton.icon( // <-- TextButton
                      onPressed: () {
                        _openImagePicker();
                      },
                      icon:Icon(Icons.upload_rounded),

                      label: Text('upload image'),
                      style: TextButton.styleFrom(
                        primary:Colors.blue[300],
                      ),
                    ),
                    SizedBox(height: 10,),
                    MaterialButton(
                  elevation: 5,
                      height: 40,
                        minWidth: 60,
                        color: Colors.blue,
                        onPressed: (){
                    property.addProperty();
                    Navigator.pop(context);
                        },
                    child: Text('save' ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),),),
                    SizedBox(height: 20,),


                  ],
                ),


              )
          );

        },
        icon: Icon(Icons.add),
        label: Text('add property'),
        backgroundColor: Colors.green[200],
        foregroundColor: Colors.white,

      ),
      appBar: MyAppBar(context),

      body: Container(
       color: Color(0xFFF8FBFC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton.icon( // <-- TextButton
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, WelcomeScreen.screenRoute);
              },
              icon:Icon(Icons.logout),

              label: Text('logout'),
              style: TextButton.styleFrom(
                primary:Color(0xFFF27070),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
