import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:haelth_app/core/util/show.dart';
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
  List<Medicine> allowedMedicines = [];
  List<Medicine> notAllowedMedicines = [];
  List<Food> allowedFood = [];
  List<Food> notAllowedFood = [];

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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200]
              ),
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.all(7),
              child: StatefulBuilder(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 3.0.w),
                              child: Text('الاطعمة المسموحة', style: TextStyle(color: Colors.black54,fontSize: 12.0.sp,fontWeight: FontWeight.w600),),
                            ),
                            InkWell(
                              child: Icon(Icons.add, color: Colors.black,),
                              onTap:() async {
                                FocusScope.of(context).unfocus();
                                final item = await getItem<Food>();
                                if(item !=null)
                                  if(!notAllowedFood.contains(item) && !allowedFood.contains(item)) {
                                    state(()=>allowedFood.add(item));
                                  } else {
                                    showSnackBar("العنصر مضاف من قبل");
                                  }
                              },
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 7,
                          alignment: WrapAlignment.center,
                          children: [
                            for(var item in allowedFood)
                              Chip(
                                label: Text(item.name),
                                onDeleted: (){
                                  state(() => allowedFood.remove(item));
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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200]
              ),
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.all(7),
              child: StatefulBuilder(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 3.0.w),
                              child: Text('الاطعمة الممنوعة', style: TextStyle(color: Colors.black54,fontSize: 12.0.sp,fontWeight: FontWeight.w600),),
                            ),
                            InkWell(
                              child: Icon(Icons.add, color: Colors.black,),
                              onTap:() async {
                                FocusScope.of(context).unfocus();
                                final item = await getItem<Food>();
                                if(item !=null)
                                  if(!notAllowedFood.contains(item) && !allowedFood.contains(item)) {
                                    state(()=>notAllowedFood.add(item));
                                  } else {
                                    showSnackBar("العنصر مضاف من قبل");
                                  }

                              },
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 7,
                          alignment: WrapAlignment.center,
                          children: [
                            for(var item in notAllowedFood)
                              Chip(
                                label: Text(item.name),
                                onDeleted: (){
                                  state(() => notAllowedFood.remove(item));
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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200]
              ),
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.all(7),
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
                              FocusScope.of(context).unfocus();
                              Medicine med = await getItem<Medicine>();
                              if(med !=null)
                                if(!allowedMedicines.contains(med) && !notAllowedMedicines.contains(med)) {
                                  state(() => allowedMedicines.add(med));
                                } else {
                                  showSnackBar("العنصر مضاف من قبل");
                                }
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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200]
              ),
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.all(7),
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
                                FocusScope.of(context).unfocus();
                                Medicine med = await getItem<Medicine>();
                                if(med !=null) {
                                  if(!allowedMedicines.contains(med) && !notAllowedMedicines.contains(med)) {
                                    state(() => notAllowedMedicines.add(med));
                                  } else {
                                    showSnackBar("العنصر مضاف من قبل");
                                  }
                            }
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

  Future<T> getItem<T>()async{
    final foodNameController = TextEditingController();

    return showModalBottomSheet<T>(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            physics: NeverScrollableScrollPhysics(),
            child: StreamBuilder<List>(
              stream: db.watchAll<T>(),
              builder: (context, snapshot) {
                final list = (snapshot.data??[]).reversed.toList();
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (T.toString() == "Medicine")
                    ?RaisedButton(
                      onPressed: (){
                          Navigator.pushNamed(context, NameScreen.add_medicine_page);
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Text("إضافة دواء",style: TextStyle(color: Colors.white,height: 1))),
                      color: Theme.of(context).primaryColor,
                    )
                    :CustomTextField(
                      hint: "اكتب اسم جديد للاضافة",
                      iconData: Icons.add,
                      onIconClicked: ()async{
                        FocusScope.of(context).unfocus();
                        if(foodNameController.text.trim().isNotEmpty) {
                          if(!list.any((element) => element.name == foodNameController.text.trim())) {
                                await db.addFood(
                                    Food(name: foodNameController.text));
                                foodNameController.clear();
                           } else {
                                showSnackBar("الاسم مضاف من قبل");
                          }
                        }
                      },
                      controller: foodNameController,
                      margin: EdgeInsets.symmetric(vertical: 1.0.h),
                      maxLines: 1,
                    ),
                    Divider(),
                    SizedBox(
                      height: 25.0.h,
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListView.separated(
                          itemCount: list.length,
                          separatorBuilder: (_,__)=> SizedBox(height: 1.0.h,),
                          padding: EdgeInsets.only(bottom: 1.0.h),
                          itemBuilder: (context,i){
                            return InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: (){
                                Navigator.pop(context,list[i]);
                              },
                              child: Ink(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black26)
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                  child: Row(
                                    children: [
                                      Expanded(flex: 4,child: Center(child: Text(list[i].name))),
                                      if(T.toString() == "Food")
                                        Expanded(child: Center(child: GestureDetector(
                                            onTap: (){
                                              db.deleteFood(list[i].id);
                                            },
                                            child: Icon(Icons.cancel_outlined)))),
                                    ],
                                  )),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
          );
        }
    );
  }

  addDiet(context)async{
    try{
      if(name?.isEmpty??true) {
        showSnackBar('يرجى إضافة اسم');
      } else {
        int id = await db.addDiet(Diet(
            name: name,
            startDate: range.start,
            endDate: range.end,
            description: description));
        await Future.forEach<Medicine>(allowedMedicines, (element) =>
            db.addDietMedicine(MedicineDiet(medicineId: element.id, dietId: id, isAllowed: true)));
        await Future.forEach<Medicine>(notAllowedMedicines, (element) =>
            db.addDietMedicine(MedicineDiet(medicineId: element.id, dietId: id, isAllowed: false)));
        await Future.forEach<Food>(allowedFood, (element) =>
            db.addDietFood(FoodDiet(foodId: element.id, dietId: id, isAllowed: true)));
        await Future.forEach<Food>(notAllowedFood, (element) =>
            db.addDietFood(FoodDiet(foodId: element.id, dietId: id, isAllowed: false)));
        Navigator.pop(context);
      }
    } catch(e){
      print(e);
      showSnackBar('عذرا حصل خطأ');
    }
  }

}
