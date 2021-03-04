import 'package:flutter/material.dart';

class AlertDeleteDialog extends StatelessWidget {

  final Function onDelete;

  const AlertDeleteDialog({Key key, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("هل أنت متأكد؟",style: TextStyle(fontWeight: FontWeight.bold),),
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
