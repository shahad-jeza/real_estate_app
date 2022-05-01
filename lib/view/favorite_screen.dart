import 'package:flutter/material.dart';
import 'package:real_estate_app/view/widgets/myAppBar.dart';

class FavoritesScreen extends StatefulWidget {
  static const String screenRoute = 'favorites_screen';
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context),

      body: Container(
        color: Color(0xFFF8FBFC),
      ),
    );
  }
}
