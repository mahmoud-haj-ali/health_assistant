import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
import 'package:haelth_app/core/util/show.dart';
import 'package:haelth_app/features/doctors/presentation/widget/add_doctor_dialog.dart';
import 'package:haelth_app/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AddAnalysisPage extends StatefulWidget {

  final AnalysisName name;

  const AddAnalysisPage({Key key, this.name}) : super(key: key);

  @override
  _AddAnalysisPageState createState() => _AddAnalysisPageState();
}

class _AddAnalysisPageState extends State<AddAnalysisPage> {

  AnalysisName analysisName = AnalysisName(name: '');
  String value = '';
  String notes;
  DateTime dateTime = DateTime.now();
  File image;
  Doctor doctor;
  List<AnalysisName> names = [];
  bool checkValidate = false;

  @override
  void initState() {
    super.initState();
    analysisName = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name!=null?'إضافة نتيجة':'إضافة تحليل'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w,vertical: 2.0.h),
          child: ListView(
            children: [
              SizedBox(
                height: 18.0.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: widget.name!=null?null:() async {
                                analysisName = await getName();
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black12)
                                ),
                                alignment: Alignment.center,
                                child: Center(child: Text(analysisName?.name??"اضغط لإختيار اسم",textAlign: TextAlign.center,),),
                              ),
                            ),
                          ),
                          if(checkValidate && (analysisName?.name?.isEmpty??true))
                            Padding(
                              padding: EdgeInsets.only(top: 1.0.h),
                              child: Text("يرجى اختيار اسم",style: TextStyle(color: Colors.red,fontSize: 12),),
                            ),
                          SizedBox(height: 1.0.h,),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    alignLabelWithHint: true,
                                    hintText: "النسبة"
                                  ),
                                  onChanged: (v){
                                    value = v;
                                  },
                                  onSubmitted: (_){
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                          // if(checkValidate && value.isEmpty)
                          //   Padding(
                          //     padding: EdgeInsets.only(top: 1.0.h),
                          //     child: Text("يرجى إضافة نسبة",style: TextStyle(color: Colors.red,fontSize: 12),),
                          //   )
                        ],
                      ),
                    ),
                    SizedBox(width: 2.0.w,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          showModalBottomSheet(context: context,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                            builder: (context){
                              return Container(
                                height: 30.0.h,
                                padding: EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 5.0.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          Navigator.pop(context);
                                          image = await getImage(true);
                                          setState((){});
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 1.5,offset: Offset(0.0,1.0))]
                                          ),
                                          child: Center(child: Icon(Icons.camera_alt_rounded,size: 30.0.sp,)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4.0.w,),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          Navigator.pop(context);
                                          image = await getImage(false);
                                          setState(() {});
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 1.5,offset: Offset(0.0,1.0))]
                                          ),
                                          child: Center(child: Icon(Icons.image_outlined,size: 30.0.sp,)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 1.5,offset: Offset(0.0,1.0))],
                            image: image==null?null:DecorationImage(
                              image: MemoryImage(image.readAsBytesSync()),
                              fit: BoxFit.cover
                            )
                          ),
                          child: image!=null?null:Center(child: Icon(Icons.add_a_photo_outlined,size: 30.0.sp,)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: ()async{
                  doctor = await getDoctor();
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.only(top: 2.0.h),
                  padding: EdgeInsets.symmetric(vertical: 1.0.h,horizontal: 4.0.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(child: Text(doctor==null ? 'الطبيب المشرف':"الطبيب المشرف: ${doctor.name}")),
                      ),
                      if(doctor != null)
                        GestureDetector(
                            onTap: (){
                              doctor = null;
                              setState((){});
                            },
                            child: Icon(Icons.cancel_outlined,color: Colors.red,))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()async{
                  final date = await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(colorScheme: ColorScheme.light().copyWith(primary: Colors.teal)),
                          child: child,
                        );
                      }
                  );
                  if(date != null) {
                    dateTime = date;
                    setState(() {});
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.symmetric(vertical: 2.0.h),
                  padding: EdgeInsets.symmetric(vertical: 1.0.h),
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(child: Text('   تاريخ ${widget.name == null?"التحليل":"النتيجة"}')),
                        Expanded(child: Text(DateFormat('yyyy-MM-dd').format(dateTime),style: TextStyle(height: 1.5),)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "ملاحظات:",
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                  ),
                  maxLines: 5,
                  onChanged: (v){
                    notes = v;
                  },
                ),
              ),
              SizedBox(height: 5.0.h,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: ()async{
                    if(analysisName.name.isEmpty){
                      checkValidate = true;
                      setState(() {});
                    } else if(value.isEmpty && image == null){
                      showSnackBar("يرجى إضافة نتيجة او صورة");
                    }  else if(doctor == null){
                      showSnackBar("يرجى إضافة طبيب مشرف");
                    } else {
                      Analysis analysis = Analysis(lastDate: dateTime,
                          nameId: analysisName.id, notes: notes,
                          image: image?.path,value: value, doctorId: doctor?.id,
                          name: analysisName.name);
                      await db.addAnalysis(analysis);
                      DateTime lastDate = dateTime;
                      (await db.getAllAnalysis(analysis.nameId)).forEach((element) {
                        if(element.lastDate.isAfter(lastDate)??false)
                          lastDate = element.lastDate;
                      });
                      db.updateAnalysisName(analysisName.copyWith(lastDate: lastDate));
                      Navigator.pop(context);
                    }
                  },
                  child: Center(child: Text('حفظ')))
            ],
          ),
        ),
      ),
    );
  }

  Future<AnalysisName> getName()async{
    final nameController = TextEditingController();

    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            physics: NeverScrollableScrollPhysics(),
            child: StreamBuilder<List<AnalysisName>>(
                stream: db.watchAllAnalysisNames,
                builder: (context, snapshot) {
                  final list = (snapshot.data??[]).reversed.toList();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        hint: "اكتب اسم جديد للاضافة",
                        iconData: Icons.add,
                        onIconClicked: ()async{
                          final names = await db.getAllAnalysisNames;
                          if(nameController.text.trim().isNotEmpty) {
                            if(!names.any((element) => element.name == nameController.text.trim())) {
                              await db.addAnalysisName(AnalysisName(name: nameController.text));
                              nameController.clear();
                            } else {
                              showSnackBar("التحليل مضاف من قبل");
                            }
                          }
                        },
                        controller: nameController,
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
                                    child: Center(child: Text(list[i].name))),
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

  Future<File> getImage(bool isCamera) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: isCamera?ImageSource.camera:ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<Doctor> getDoctor() async {
    return showModalBottomSheet<Doctor>(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            physics: NeverScrollableScrollPhysics(),
            child: StreamBuilder<List<Doctor>>(
                stream: db.watchAllDoctors,
                builder: (context, snapshot) {
                  final list = (snapshot.data??[]).reversed.toList();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RaisedButton(
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (_) => AddDoctorDialog());
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text("إضافة طبيب",style: TextStyle(color: Colors.white,height: 1))),
                        color: Theme.of(context).primaryColor,
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
                                    child: Center(child: Text(list[i].name))),
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
}
