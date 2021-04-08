import 'package:flutter/material.dart';

class AlertDeleteDialog extends StatelessWidget {

  final Function onDelete;
  final String subtext;
  const AlertDeleteDialog({Key key, this.onDelete, this.subtext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("هل أنت متأكد؟",style: TextStyle(fontWeight: FontWeight.bold),),
          if(subtext != null)
            Text(subtext,style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
      actions: [
        RaisedButton(
          highlightElevation: 2,
          child: Text("لا"),
          onPressed: ()=> Navigator.pop(context)),
        RaisedButton(
          highlightElevation: 2,
          child: Text("نعم"),
          onPressed: (){
            onDelete();
            Navigator.pop(context);
          }),
      ],
    );
  }
}
