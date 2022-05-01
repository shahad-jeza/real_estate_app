import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_app/view/favorite_screen.dart';
import 'package:real_estate_app/view/profile_screen.dart';
import 'package:real_estate_app/view/widgets/myAppBar.dart';
import'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  static const String screenRoute = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

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

  //void getProperty()async{
   // final properrties = await _firestore.collection('properties').get();
   // for(var property in properrties.docs){
   //   print(property.data());
  //  }
  //}

  void propertiesStream() async{
    await for (var snapshot in _firestore.collection('properties').snapshots()){
      for (var property in snapshot.docs){
        print(property.data());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        propertiesStream();
      },
        child: Icon(Icons.chat_rounded),
        backgroundColor: Colors.green[200],
        foregroundColor: Colors.white,
      ),
      appBar: MyAppBar(context),
      body: Container(
          color: Color(0xFFF8FBFC),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton.icon( // <-- TextButton
                    onPressed: () {},
                    icon:
                    Image.asset(
                      'assets/icons/filter-2.png', width: 15, height: 15,),

                    label: Text('filter results'),
                    style: TextButton.styleFrom(
                      primary: Colors.black26,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/apartment-3.png'),
                    iconSize: 81,
                    onPressed: () {},
                  ),

                  IconButton(
                    icon: Image.asset('assets/images/villas.png'),
                    iconSize: 81,
                    onPressed: () {},
                  ),

                  IconButton(
                    icon: Image.asset('assets/images/lands.png'),
                    iconSize: 81,
                    onPressed: () {},
                  ),

                  IconButton(
                    icon: Image.asset('assets/images/buildings.png'),
                    iconSize: 81,
                    onPressed: () {},
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 500,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Card(
                            child: ListTile(
                              title: Text('example title'),
                              subtitle: Text("this is a random sub title"),
                              leading: Image.asset('assets/images/images.jpg' ),
                              trailing: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.favorite_border),
                              )
                            ),

                          ),

                         


                        ],
                      ),
                    ),
                  )
                ],
              )


            ],
          )

      ),

    );
  }
}
