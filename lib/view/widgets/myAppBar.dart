import 'package:flutter/material.dart';
import 'package:real_estate_app/view/home_screen.dart';

import '../favorite_screen.dart';
import '../profile_screen.dart';


AppBar MyAppBar(BuildContext context) {
  return AppBar(
      backgroundColor:Color(0xFFDAE7EC) ,
      actions: [

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
          child: IconButton(
            onPressed: (){
              Navigator.pushNamed(context, ProfileScreen.screenRoute);
            },
            icon:Image.asset('assets/icons/account.png' , width: 40,height: 40,) ,
          ),
        ),

      ],

      leading: IconButton(
        onPressed: (){
          Navigator.pushNamed(context, FavoritesScreen.screenRoute);
        },
        icon: Icon(Icons.favorite),
        color: Color(0xFFF27070),
      ),

      title: IconButton(
        icon: Image.asset('assets/images/logoText.png'),
        iconSize: 300,
        onPressed: (){
          Navigator.pushNamed(context, HomeScreen.screenRoute);
        },
      )
  );
}
