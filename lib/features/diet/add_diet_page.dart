import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class AddDietPage extends StatefulWidget {
  @override
  _AddDietPageState createState() => _AddDietPageState();
}

class _AddDietPageState extends State<AddDietPage> {

  String name;
  String description;
  DateTimeRange range = DateTimeRange(start: DateTime.now(),end: DateTime.now().add(Duration(days: 30)));
  String allowedFood;
  String preventFood;
  List<Medicine> allowedMedicines = [];
  List<Medicine> notAllowedMedicines = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('حمية جديدة'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w),
        child: Column(
          children: [
            SizedBox(height: 1.0.h,),
            CustomTextField(
              color: Colors.grey[200],
              maxLines: 1,
              margin: EdgeInsets.zero,
              onChanged: (value) => name = value,
              labelText: "اسم الحمية",
            ),
            SizedBox(height: 1.0.h,),
            CustomTextField(
              color: Colors.grey[200],
              maxLines: 1,
              margin: EdgeInsets.zero,
              onChanged: (value) => allowedFood = value,
              labelText: "الاطعمة المسموحة",
            ),
            SizedBox(height: 1.0.h,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200]
              ),
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.all(4),
              child: StatefulBuilder(
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 3.0.w),
                            child: Text('الادوية المصاحبة للحمية', style: TextStyle(color: Colors.black54,fontSize: 12.0.sp,fontWeight: FontWeight.w600),),
                          ),
                          InkWell(
                            child: Icon(Icons.add, color: Colors.black,),
                            onTap:() async {
                              List<Medicine> medicines;
                              Medicine med;
                              FocusScope.of(context).unfocus();
                              await showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  builder: (context){
                                    return SingleChildScrollView(
                                      padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                                      physics: NeverScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RaisedButton(
                                            onPressed: (){
                                              Navigator.pushNamed(context, NameScreen.add_medicine_page);
                                            },
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            child: Center(child: Text("إضافة دواء",style: TextStyle(color: Colors.white,height: 1))),
                                            color: Theme.of(context).primaryColor,
                                          ),
                                          SizedBox(
                                            height: 25.0.h,
                                            child: StreamBuilder<List<Medicine>>(
                                              stream: db.watchAllMedicines,
                                              builder: (context, snapshot) {
                                                medicines = (snapshot.data??[]).reversed.toList();
                                                return ListView.separated(
                                                  itemCount:medicines.length,
                                                  separatorBuilder: (_,__)=> SizedBox(height: 1.0.h,),
                                                  padding: EdgeInsets.only(bottom: 1.0.h),
                                                  itemBuilder: (context,i){
                                                    return InkWell(
                                                      borderRadius: BorderRadius.circular(10),
                                                      onTap: (){
                                                        med = medicines[i];
                                                        Navigator.pop(context);
                                                      },
                                                      child: Ink(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          border: Border.all(color: Colors.black26)
                                                        ),
                                                        padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                                        child: Center(child: Text(medicines[i].name))),
                                                    );
                                                  },
                                                );
                                              }
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              );
                              if(med !=null)
                                state(()=>allowedMedicines.add(med));
                            },
                          )
                        ],
                      ),
                      Wrap(
                        spacing: 7,
                        alignment: WrapAlignment.center,
                        children: [
                          for(var item in allowedMedicines)
                            Chip(
                              label: Text(item.name),
                              onDeleted: (){
                                state(() => allowedMedicines.remove(item));
                              },
                              labelPadding: EdgeInsets.only(right: 5),
                            ),
                        ],
                      )
                    ],
                  );
                }
              ),
            ),
            SizedBox(height: 1.0.h,),
            CustomTextField(
              color: Colors.grey[200],
              maxLines: 1,
              margin: EdgeInsets.zero,
              onChanged: (value) => preventFood = value,
              labelText: "الاطعمة الممنوعة",
            ),
            SizedBox(height: 1.0.h,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200]
              ),
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.all(4),
              child: StatefulBuilder(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 3.0.w),
                              child: Text('الادوية الممنوعة', style: TextStyle(color: Colors.black54,fontSize: 12.0.sp,fontWeight: FontWeight.w600),),
                            ),
                            InkWell(
                              child: Icon(Icons.add, color: Colors.black,),
                              onTap:() async {
                                List<Medicine> medicines;
                                Medicine med;
                                FocusScope.of(context).unfocus();
                                await showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    builder: (context){
                                      return SingleChildScrollView(
                                        padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                                        physics: NeverScrollableScrollPhysics(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            RaisedButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                                Navigator.pushNamed(context, NameScreen.add_medicine_page);
                                              },
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                              child: Center(child: Text("إضافة دواء",style: TextStyle(color: Colors.white,height: 1))),
                                              color: Theme.of(context).primaryColor,
                                            ),
                                            SizedBox(
                                              height: 25.0.h,
                                              child: StreamBuilder<List<Medicine>>(
                                                stream: db.watchAllMedicines,
                                                builder: (context, snapshot) {
                                                  medicines = (snapshot.data??[]).reversed.toList();
                                                  return ListView.separated(
                                                    itemCount: medicines.length,
                                                    separatorBuilder: (_,__)=> SizedBox(height: 1.0.h,),
                                                    padding: EdgeInsets.only(bottom: 1.0.h),
                                                    itemBuilder: (context,i){
                                                      return InkWell(
                                                        borderRadius: BorderRadius.circular(10),
                                                        onTap: (){
                                                          med = medicines[i];
                                                          Navigator.pop(context);
                                                        },
                                                        child: Ink(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                border: Border.all(color: Colors.black26)
                                                            ),
                                                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                                            child: Center(child: Text(medicines[i].name))),
                                                      );
                                                    },
                                                  );
                                                }
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                );
                                if(med !=null)
                                  state(()=>notAllowedMedicines.add(med));
                              },
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 7,
                          alignment: WrapAlignment.center,
                          children: [
                            for(var item in notAllowedMedicines)
                              Chip(
                                label: Text(item.name),
                                onDeleted: (){
                                  state(() => notAllowedMedicines.remove(item));
                                },
                                labelPadding: EdgeInsets.only(right: 5),
                              ),
                          ],
                        )
                      ],
                    );
                  }
              ),
            ),
            SizedBox(height: 1.0.h,),
            StatefulBuilder(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: ()async{
                      DateTimeRange _range = await showDateRangePicker(context: context,
                          firstDate: DateTime.now().subtract(Duration(days: 7)),
                          lastDate: DateTime.now().add(Duration(days: 1000)),
                          builder: (context,child){
                            return Theme(
                              data: ThemeData.light().copyWith(colorScheme: ColorScheme.light()
                                  .copyWith(primary: Colors.teal),
                                  primaryColor: Colors.teal
                              ),
                              child: child,
                            );
                          }
                      );
                      range = _range ?? range;
                      state((){});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200]
                      ),
                      clipBehavior: Clip.antiAlias,
                      padding: EdgeInsets.fromLTRB(10.0,5.0,10.0,7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 1.0.w),
                            child: Text('مدة الحمية',style: TextStyle(color: Colors.black54,fontSize: 12.0.sp,fontWeight: FontWeight.w600),),
                          ),
                          SizedBox(height: 5,),
                          Center(
                            child: Text(range==null?"غير محدد":"${DateFormat('yyyy-MM-dd').format(range.start)}  -->  ${DateFormat('yyyy-MM-dd').format(range.end)}",style: TextStyle(height: 1),),
                          ),
                        ],
                      ),
                    ),
                  );
                }
            ),
            SizedBox(height: 1.0.h,),
            CustomTextField(
              height: 100,
              color: Colors.grey[200],
              margin: EdgeInsets.zero,
              expands: true,
              maxLines: null,
              onChanged: (value){
                description = value;
              },
              labelText: "وصف الحمية",
            ),
            Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: ()=>addDiet(context),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text("إضافة",style: TextStyle(color: Colors.white,height: 1)),
                    color: Theme.of(context).primaryColor,
                  );
                }
            )
          ],
        ),
      ),
    );
  }

  addDiet(context)async{
    try{
      if(name.isEmpty) {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('يرجى إضافة اسم',
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),),
              duration: Duration(seconds: 1),
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ));
      } else {
        int id = await db.addDiet(Diet(
            name: name,
            startDate: range.start,
            allowedFood: allowedFood,
            preventFood: preventFood,
            endDate: range.end,
            description: description));
        await Future.forEach<Medicine>(allowedMedicines, (element) =>
            db.addDietMedicine(MedicineDiet(medicineId: element.id, dietId: id, isAllowed: true)));
        await Future.forEach<Medicine>(notAllowedMedicines, (element) =>
            db.addDietMedicine(MedicineDiet(medicineId: element.id, dietId: id, isAllowed: false)));
        Navigator.pop(context);
      }
    } catch(e){
      print(e);
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('عذرا حصل خطأ',
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),),
            duration: Duration(seconds: 1),
            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ));
    }
  }

}
