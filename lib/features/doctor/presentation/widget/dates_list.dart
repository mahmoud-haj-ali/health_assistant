import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/alert_delete_dialog.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class DatesListWidget extends StatelessWidget {

  final Doctor doctor;
  const DatesListWidget({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Divider(color: Colors.black54,thickness: 2,)),
              SizedBox(width: 5,),
              Text("المواعيد",style: TextStyle(fontSize: 20),),
              SizedBox(width: 5,),
              Flexible(child: Divider(color: Colors.black54,thickness: 2,)),
            ],
          ),
          Expanded(
            child: StreamBuilder<List<Date>>(
              stream: db.watchAllDoctorDates(doctor.id),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                  return Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Center(child: CircularProgressIndicator(strokeWidth: 1,),),
                  );
                List<Date> dates = snapshot.data.reversed.toList()??[];
                if(dates.isEmpty)
                  return Center(
                    child: Text("لا يوجد مواعيد\nإضغط على + لإضافة موعد",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,height: 1.5),),
                  );
                return ListView.separated(
                  itemCount: dates.length,
                  padding: EdgeInsets.only(bottom: 60,left: 5,right: 5),
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (_,__) => SizedBox(height: 10,),
                  itemBuilder: (context,i){
                    return Material(
                      elevation: dates[i].date.isBefore(DateTime.now())?0:3,
                      color: dates[i].date.isBefore(DateTime.now())?Colors.grey.shade400:Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(DateFormat("yyyy-MM-dd").format(dates[i].date), style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                        subtitle: Text(DateFormat("hh:mm").format(dates[i].date), style: TextStyle(fontSize: 14),),
                        leading: Icon(Icons.date_range,size: 25,color: dates[i].date.isBefore(DateTime.now())?Colors.white:Theme.of(context).primaryColor,),
                        dense: true,
                        trailing: IconButton(
                          icon: Icon(Icons.cancel_rounded,color: Colors.red.shade800,),
                          iconSize: 25,
                          onPressed: (){
                            showDialog(context: context,
                                builder:(cxt) => AlertDeleteDialog(
                                    onDelete: () => db.deleteDate(dates[i].id)
                                ));
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
