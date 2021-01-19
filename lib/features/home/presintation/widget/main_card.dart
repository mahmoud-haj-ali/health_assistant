import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {

  final String imageName;
  final String text;
  final Color color;
  final Function onPressed;
  const MainCard({Key key, this.imageName, this.color, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/background/$imageName"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(color, BlendMode.colorBurn)
          )
        ),
        child: Center(
          child: Text(text,style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
