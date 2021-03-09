import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {

  final String imageName;
  final String text;
  final Color color;
  final Function onPressed;
  const MainCard({Key key, this.imageName, this.color, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: InkWell(
          onTap: onPressed,
          splashColor: color.withOpacity(.3),
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          child: Ink(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                boxShadow: [BoxShadow(color: Colors.black45,offset: Offset(0.0,1.5),blurRadius: 3)],
                image: DecorationImage(
                  image: ExactAssetImage("assets/background/$imageName"),
                  fit: BoxFit.cover,
                )
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.8),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(text,
                  style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
