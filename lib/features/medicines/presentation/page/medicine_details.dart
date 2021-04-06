import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:haelth_app/main.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class MedicineDetails extends StatelessWidget {

  final Medicine m;

  const MedicineDetails({Key key, this.m}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color prColor = Theme.of(context).primaryColor;
    return StreamBuilder<Medicine>(
      stream: db.watchMedicine(m.id),
      initialData: m,
      builder: (context, snapshot) {
        var medicine = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(medicine.name,maxLines: 2,),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: (){
                  Navigator.pushNamed(context, NameScreen.add_medicine_page,arguments: medicine);
                })
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0.w,vertical: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 4,
                  margin: EdgeInsets.only(bottom: 1.5.h),
                  child: Column(
                    children: [
                      Center(child: Text('ملاحظات',
                        style: TextStyle(fontSize: 12.0.sp,fontWeight: FontWeight.w700,color: Colors.grey[500],height: 1.8))),
                      Text(medicine.notes??'لايوجد'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.0.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          elevation: 4,
                          margin: EdgeInsets.zero,
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "يجب اخذ ",
                                style: TextStyle(color: Colors.grey[600],fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,fontWeight: FontWeight.w700,height: 2.5),
                                children: [
                                  TextSpan(
                                    text: medicine.unit,
                                    style: TextStyle(color: prColor)
                                  ),
                                  TextSpan(
                                      text: ' او اكثر\n'
                                  ),
                                  TextSpan(
                                    text: amount(medicine.repeat),
                                    style: TextStyle(color: prColor)
                                  ),
                                  TextSpan(
                                    text: ' في اليوم\n'
                                  ),
                                  TextSpan(
                                    text: medicine.isAfter?'بعد الطعام':'قبل الطعام',
                                    style: TextStyle(color: prColor)
                                  ),
                                ]
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.0.w,),
                      Expanded(
                        child: Card(
                          margin: EdgeInsets.zero,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.only(top: 1.0.h),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("بدء استخدام الدواء",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 9.0.sp,color: Colors.grey[600])),
                                      Text(medicine.startDate!=null?DateFormat('yyyy-MM-dd').format(medicine.startDate):'غير محدد',
                                        style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.w700,height: 2,color: prColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("نهاية استخدام الدواء",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 9.0.sp,color: Colors.grey[600]),),
                                      Text(medicine.endDate!=null?DateFormat('yyyy-MM-dd').format(medicine.endDate):'غير محدد',
                                        style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.w700,height: 2,color: prColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 4,
                  margin: EdgeInsets.only(top: 1.5.h),
                  child: Column(
                    children: [
                      Center(child: Text('مواعيد اخذ الدواء',
                          style: TextStyle(fontSize: 12.0.sp,fontWeight: FontWeight.w700,color: Colors.grey[500],height: 1.8))),
                      StreamBuilder<List<MedicineReminder>>(
                        stream: db.watchAllMedicineReminders(medicine.id),
                        builder: (context,snapshot){
                          final dates = snapshot.data ?? [];
                          if(dates.isEmpty){
                            return Text('لايوجد',
                                style: TextStyle(fontSize: 12.0.sp,height: 1.8));
                          } else {
                            return Wrap(
                              children: [
                                for(final date in dates)
                                  Chip(label: Text(DateFormat('HH:mm').format(date.date)))
                              ],
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  String amount(int number){
    switch(number){
      case 1:
        return 'مرة واحدة';
      case 2:
        return 'مرتين';
      default:
        return "$number مرات";
    }
  }
}
