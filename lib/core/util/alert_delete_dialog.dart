import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AlertDeleteDialog extends StatelessWidget {

  final Function onDelete;
  final String subtext;
  const AlertDeleteDialog({Key key, this.onDelete, this.subtext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15.0.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.symmetric(horizontal: 5.0.w,vertical: 1.0.h),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("هل أنت متأكد؟",style: TextStyle(fontWeight: FontWeight.bold,height: 2),),
          if(subtext != null)
            Text(subtext,style: TextStyle(height: 1.5,fontSize: 12.0.sp),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              onDelete();
              Navigator.pop(context);
            },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                primary: Colors.red
              ),
            child: Center(child: Text("نعم"))),
          OutlinedButton(
              onPressed: ()=> Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  primary: Colors.teal,
                side: BorderSide(
                  color: Colors.teal
                )
              ),
              child: Center(child: Text("لا"))
          ),
        ],
      ),
    );
  }
}
