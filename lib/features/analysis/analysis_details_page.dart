import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:haelth_app/core/util/photo_view_page.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';

import '../../main.dart';

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
               height: 30.0.h,
               width: double.infinity,
               color: Colors.grey[300],
               child: GestureDetector(
                 onTap: () => Navigator.of(context).push(
                     CupertinoPageRoute(builder: (context) =>
                         SinglePhotoViewPage(image: analysis.image,))),
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
                   },),
               )),
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
                          alignment: Alignment(0.0,analysis.value.isEmpty?0.5:2.0),
                          child: Text(analysis.value.isEmpty ? "لايوجد نتيجة" : analysis.value,
                            style: TextStyle(color: Theme.of(context).primaryColor,fontSize:analysis.value.isEmpty?20.0.sp: 60.0.sp,fontWeight: FontWeight.w700),),
                        )),
                        Expanded(child: Center(child: Text('النتيجة'))),
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
          if(analysis.doctorId != null)
          FutureBuilder<Doctor>(
            future: db.getDoctor(analysis.doctorId),
            builder: (context, snapshot) {
              if(!snapshot.hasData)
                return SizedBox.shrink();
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0.w,vertical: 1.0.h),
                  child: Center(child: Text('بإشراف الطبيب ${snapshot.data.name}')),
                ),
              );
            }
          ),
          if(analysis.notes != null && analysis.notes.trim().isNotEmpty)
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
                  Center(child: Text(analysis.notes))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
