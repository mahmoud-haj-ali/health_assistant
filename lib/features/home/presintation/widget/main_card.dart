import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {

  final String imageName;
  final String text;
  final Color color;
  final Function onPressed;
  const MainCard({Key key, this.imageName, this.color, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body2();
  }

  Widget body1(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: InkWell(
        onTap: onPressed,
        splashColor: color.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.black54,offset: Offset(0.0,1.5),blurRadius: 3)],
              image: DecorationImage(
                  image: ExactAssetImage("assets/background/$imageName"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(color.withOpacity(.3), BlendMode.softLight)
              )
          ),
          child: Row(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        stops: [0.1,1.0,1.0],
                        colors: [Colors.transparent,Colors.black87,Colors.black]
                    )
                ),
                child: Align(
                  alignment: Alignment(0.7,0.0),
                  child: Text(text,
                    style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,
                      // shadows: [BoxShadow(color: Colors.black,offset: Offset(0.0,1.5),blurRadius: 3)]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget body2(){
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
                boxShadow: [BoxShadow(color: Colors.black54,offset: Offset(0.0,1.5),blurRadius: 3)],
                image: DecorationImage(
                    image: ExactAssetImage("assets/background/$imageName"),
                    fit: BoxFit.cover,
                )
            ),
            child: Container(
              width: 150,
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
