import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  MyButton({
    required this.title,
    required this.onPressed,
    required this.color
  });

  final String title;
  final VoidCallback onPressed;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 5,
      borderRadius:BorderRadius.all(Radius.circular(50)),
      child: MaterialButton(
        onPressed:  onPressed,
        height: 60,
        minWidth: 250,
        child: Text(title ,
          style: TextStyle(
            color: Colors.white,
            fontSize:24,
          ),),
      ),
    );
  }
}