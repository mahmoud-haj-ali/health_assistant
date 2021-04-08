import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/textfield_search.dart';
import 'package:haelth_app/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AddAnalysisPage extends StatefulWidget {

  @override
  _AddAnalysisPageState createState() => _AddAnalysisPageState();
}

class _AddAnalysisPageState extends State<AddAnalysisPage> {

  TextEditingController myController = TextEditingController();
  String value = '';
  String notes;
  DateTime dateTime = DateTime.now();
  File image;
  List<AnalysisName> names = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة تحليل'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w,vertical: 2.0.h),
          child: Column(
            children: [
              SizedBox(
                height: 18.0.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: StreamBuilder<List<AnalysisName>>(
                              stream: db.watchAllAnalysisNames,
                              builder: (context, snapshot) {
                                names = snapshot.data??[];
                                return TextFieldSearch(
                                  label: 'عنوان التحليل',
                                  initialList: names.map((e) => e.name).toList(),
                                  controller: myController,
                                  // getSelectedValue: print,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: 'عنوان التحليل',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                );
                              }
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "نسبة التحليل",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (v){
                                value = v;
                              },
                            ),
                          ),
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
                  final date = await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
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
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.symmetric(vertical: 2.0.h),
                  padding: EdgeInsets.symmetric(vertical: 1.0.h),
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(child: Text('   تاريخ التحليل:')),
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
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  maxLines: 5,
                  onChanged: (v){
                    notes = v;
                  },
                ),
              ),
              SizedBox(height: 5.0.h,),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: ()async{
                      if(myController.text.isEmpty || value.isEmpty){
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('يرجى ملئ البيانات',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),),
                              duration: Duration(seconds: 2),
                            ));
                      } else {
                        int nameId;
                        if(names.any((element) => element.name == myController.text)){
                          nameId = names.singleWhere((element) => element.name == myController.text).id;
                        } else {
                          nameId = await db.addAnalysisName(AnalysisName(name: myController.text,lastDate: dateTime));
                        }
                        Analysis analysis = Analysis(lastDate: dateTime, nameId: nameId,notes: notes,image: image?.path,value: value,name: myController.text);
                        await db.addAnalysis(analysis);
                        Navigator.pop(context);
                      }
                    },
                    child: Center(child: Text('حفظ')));
                }
              )
            ],
          ),
        ),
      ),
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
}
