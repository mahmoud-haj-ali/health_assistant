import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../main.dart';

class DoctorInfoWidget extends StatefulWidget {

  final Doctor doctor;
  const DoctorInfoWidget({Key key, this.doctor}) : super(key: key);

  @override
  _DoctorInfoWidgetState createState() => _DoctorInfoWidgetState();
}

class _DoctorInfoWidgetState extends State<DoctorInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final title = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Divider(color: Colors.black54,thickness: 2,)),
        SizedBox(width: 5,),
        Text("التفاصيل",style: TextStyle(fontSize: 20),),
        SizedBox(width: 5,),
        Flexible(child: Divider(color: Colors.black54,thickness: 2,)),
      ],
    );
    return FutureBuilder<List<List>>(
        future: Future.wait([db.getDoctorMedicines(widget.doctor.id), db.getDoctorAnalysis(widget.doctor.id)]),
        builder: (context, snapshot) {
          List<Medicine> medicines = [];
          List<Analysis> analysis = [];
          if(snapshot.hasData){
            List<String> analysisNames = [];
            medicines = snapshot.data[0] ?? [];
            analysis = (snapshot.data[1] ?? []).reversed.map<Analysis>((e) {
              if(analysisNames.contains(e.name)){
                return null;
              } else {
                analysisNames.add(e.name);
                return e;
              }
            }).toList()..removeWhere((element) => element == null);
          }
          if(!snapshot.hasData) {
            return Column(
              children: [
                title,
                Container(
                  height: 10.0.h,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ],
            );
          } else if(medicines.isEmpty && analysis.isEmpty){
            return Column(
              children: [
                title,
                Container(
                  height: 10.0.h,
                  child: Center(child: Text("لايوجد تفاصيل")),
                ),
              ],
            );
          } else {
            return Expanded(
              child: Column(
                children: [
                  title,
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(analysis.isEmpty?"لايوجد تحاليل يشرف عليها":"يشرف على التحاليل",textAlign: TextAlign.center,),
                              analysis.isEmpty
                                  ?SizedBox.shrink()
                                  :Expanded(
                                    child: ListView.separated(
                                itemCount: analysis.length,
                                padding: EdgeInsets.only(left: 1.0.w,right: 1.0.w),
                                separatorBuilder: (_,__) => SizedBox(height: 1.0.h,),
                                itemBuilder: (context,i){
                                    return Material(
                                      elevation: 0,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                          side: BorderSide(color: Colors.black12)),
                                      child: ListTile(
                                        onTap: ()async{
                                          await Navigator.pushNamed(context, NameScreen.analysis_dates_list_page,
                                              arguments: {"name":AnalysisName(id: analysis[i].nameId,name: analysis[i].name),
                                                "doctor": widget.doctor});
                                          setState((){});
                                        },
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        title: Text(analysis[i].name, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                        subtitle: Text(DateFormat("yyyy-dd-MM").format(analysis[i].lastDate), style: TextStyle(fontSize: 14),),
                                        dense: true,
                                        trailing: Text(analysis[i].value,style: TextStyle(height: 1, fontWeight: FontWeight.bold),),
                                      ),
                                    );
                                },
                              ),
                                  ),
                            ],
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          width: 0.5.w,
                          color: Colors.black38,
                          margin: EdgeInsets.only(bottom: 0.7.h),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(medicines.isEmpty?"لايوجد ادوية يشرف عليها":"يشرف على الادوية",textAlign: TextAlign.center,),
                              medicines.isEmpty
                                  ?SizedBox.shrink()
                                  :Expanded(
                                    child: ListView.separated(
                                itemCount: medicines.length,
                                padding: EdgeInsets.only(left: 5,right: 5),
                                shrinkWrap: true,
                                separatorBuilder: (_,__) => SizedBox(height: 10,),
                                itemBuilder: (context,i){
                                    return Material(
                                      elevation: 0,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.black12)),
                                      child: ListTile(
                                        onTap: ()async{
                                          await Navigator.pushNamed(context, NameScreen.medicine_details_page,arguments: medicines[i]);
                                          setState(() {});
                                        },
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        title: Text(medicines[i].name, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                        dense: true,
                                      ),
                                    );
                                },
                              ),
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

        }
    );
  }
}