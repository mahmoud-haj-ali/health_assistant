import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/alert_delete_dialog.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class AnalysisDatesPage extends StatelessWidget {
  final AnalysisName name;

  const AnalysisDatesPage({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name.name),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('إضافة تحليل',style: TextStyle(height: 2),),
        highlightElevation: 0,
        onPressed: () => Navigator.pushNamed(context, NameScreen.add_analysis_page),
      ),
      body: StreamBuilder<List<Analysis>>(
          stream: db.watchAllAnalysis(name.id),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            final analysis = snapshot.data ?? [];
            if(analysis.isEmpty)
              return Center(child: Text('لايوجد تحاليل مضافة'));
            return GridView.builder(
              itemCount: analysis.length,
              padding: EdgeInsets.symmetric(horizontal: 2.0.w,vertical: 2.0.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2.0.w,
                  crossAxisSpacing: 2.0.w,
                  childAspectRatio: 1.0,
                  crossAxisCount: 2),
              itemBuilder: (context,i){
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, NameScreen.analysis_details_page,arguments: analysis[i]),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Column(
                          children: [
                            Expanded(flex:2,child: Align(
                              alignment: Alignment(0.0,2.0),
                              child: Text(analysis[i].value.toString(),
                                style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 60.0.sp,fontWeight: FontWeight.w700),),
                            )),
                            Expanded(child: Center(child: Text(DateFormat('yyyy-MM-dd').format(analysis[i].lastDate)))),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.cancel_outlined,color: Colors.red,),
                            onPressed: (){
                              showDialog(context: context,
                                  builder: (cxt) => AlertDeleteDialog(
                                    onDelete: () async {
                                      await db.deleteAnalysis(analysis[i].id);
                                      if((await db.getAllAnalysis(analysis[i].nameId)).isEmpty){
                                        await db.deleteAnalysisName(analysis[i].nameId);
                                        Navigator.pop(context);
                                      }
                                    },
                                  ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
      ),
    );
  }
}
