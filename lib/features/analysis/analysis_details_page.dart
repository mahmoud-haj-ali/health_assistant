import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';

class AnalysisDetailsPage extends StatelessWidget {

  final Analysis analysis;

  const AnalysisDetailsPage({Key key, this.analysis}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(analysis.name.contains('تحليل')?analysis.name:'تحليل ${analysis.name}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if(analysis.image != null)
            Container(
               height: 25.0.h,
               width: double.infinity,
               color: Colors.grey[300],
               child: Image.memory(File(analysis.image).readAsBytesSync(),fit: BoxFit.cover,
                 frameBuilder: (context,child,frame,wasSynchronouslyLoaded){
                 return Stack(
                   fit: StackFit.expand,
                   children: [
                     if(frame == null)
                     Center(child: CircularProgressIndicator(),),
                     child
                   ],
                 );
                 },)),
          SizedBox(
            height: 25.0.h,
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(flex:2,child: Align(
                          alignment: Alignment(0.0,2.0),
                          child: Text(analysis.value.toString(),
                            style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 60.0.sp,fontWeight: FontWeight.w700),),
                        )),
                        Expanded(child: Center(child: Text('نسبة التحليل'))),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(flex:2,child: Align(
                          alignment: Alignment(0.0,1.5),
                          child: Text(DateFormat('yyyy\nMMM-dd').format(analysis.lastDate),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 32.0.sp,fontWeight: FontWeight.w700),),
                        )),
                        Expanded(child: Center(child: Text('تاريخ التحليل'))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if(analysis.notes != null)
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.w,vertical: 1.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ملاحظات:',style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 1.0.h,),
                  Text(analysis.notes)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
