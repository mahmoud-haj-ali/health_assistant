import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
import 'package:haelth_app/core/util/show.dart';
import 'package:sizer/sizer.dart';
import 'package:haelth_app/features/doctors/presentation/widget/add_doctor_dialog.dart';
import 'package:haelth_app/features/medicines/controller/add_medicine_controller.dart';
import 'package:haelth_app/main.dart';
import 'package:intl/intl.dart';

class AddMedicinePage extends StatefulWidget {
  final Medicine medicine;

  const AddMedicinePage({Key key, this.medicine}) : super(key: key);

  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {

  final controller = AddMedicineController();
  var amount = 1;
  var unit = 'حبة', notes;
  Doctor doctor;
  var isAfter = false;
  DateTimeRange range;
  List<TimeOfDay> times = [];

  @override
  void initState() {
    super.initState();
    if(widget.medicine != null) {
      controller.name = widget.medicine.name;
      amount = widget.medicine.repeat;
      notes = widget.medicine.notes;
      unit = widget.medicine.unit;
      isAfter = widget.medicine.isAfter;
      if(widget.medicine.startDate != null && widget.medicine.endDate != null){
        range = DateTimeRange(start: widget.medicine.startDate, end: widget.medicine.endDate);
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("دواء جديد"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  color: Colors.grey[200],
                  initialValue: widget.medicine?.name,
                  maxLines: 1,
                  margin: EdgeInsets.zero,
                  onChanged: (value){
                    controller.name = value;
                  },
                  labelText: "اسم الدواء",
                ),
                StreamBuilder<bool>(
                    stream: controller.isNameValidController.stream,
                    initialData: true,
                    builder: (context, snapshot) {
                      if(!snapshot.data) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                              alignment: Alignment(0.98, 0.0),
                              child: Text(
                                "يرجى إدخال اسم",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    height: 0.5),
                              )),
                        );
                      }
                      return SizedBox(height: 0,);
                    }
                ),
                SizedBox(height: 1.5.h,),
                FutureBuilder<List<MedicineReminder>>(
                  future: widget.medicine == null ? null : db.getMedicineReminders(widget.medicine.id),
                  builder: (context, snapshot) {
                    if(widget.medicine != null)
                      times = (snapshot.data??[]).map((e) => TimeOfDay.fromDateTime(e.date)).toList();
                    return StatefulBuilder(
                        builder: (context, state) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 55,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('المقدار اليومي',style: TextStyle(color: Colors.black54,fontSize: 13),),
                                            SizedBox(height: 4,),
                                            Expanded(
                                              child: Container(
                                                foregroundDecoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black38),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          if(amount>1) {
                                                            amount--;
                                                            if (amount == times.length - 1) times.removeLast();
                                                            state((){});
                                                          }
                                                        },
                                                        child: Container(
                                                            decoration:BoxDecoration(
                                                              color: amount>1?Theme.of(context).primaryColor:Theme.of(context).primaryColor.withOpacity(0.5),
                                                              borderRadius: BorderRadius.horizontal(right: Radius.circular(9.2)),
                                                            ),
                                                            child: Center(child: Text('-',style: TextStyle(height: 1,color: Colors.white,fontWeight: FontWeight.bold)))),
                                                      ),
                                                    ),
                                                    Expanded(flex:4,
                                                        child: Container(
                                                            color:Colors.grey[200],
                                                            child: Center(child: Text(amount.toString(),style: TextStyle(height: 1),)))),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () => amount<6?state(()=>amount++):null,
                                                        child: Container(
                                                            decoration:BoxDecoration(
                                                              color: amount<6?Theme.of(context).primaryColor:Theme.of(context).primaryColor.withOpacity(0.5),
                                                              borderRadius: BorderRadius.horizontal(left: Radius.circular(9.2)),
                                                            ),
                                                            child: Center(child: Text('+',style: TextStyle(height: 1,color: Colors.white,fontWeight: FontWeight.bold)))),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                    SizedBox(width: 15,),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('الواحدة',style: TextStyle(color: Colors.black54,fontSize: 13),),
                                            SizedBox(height: 4,),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black38),
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    color: Colors.grey[200]
                                                ),
                                                clipBehavior: Clip.antiAlias,
                                                padding: EdgeInsets.only(right: 4),
                                                child: Center(
                                                  child: DropdownButton<String>(
                                                    value: unit,
                                                    isExpanded: true,
                                                    underline: SizedBox.shrink(),
                                                    items: ["حبة","حقنة","ملعقة"].map((e) {
                                                      return DropdownMenuItem<String>(child: Text(e),value: e,);
                                                    }).toList(),
                                                    onChanged: (value) => state(() => unit = value),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.5.h,),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200]
                                ),
                                padding: EdgeInsets.all(4),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('قم بإضافة مواعيد يومية للتنبيه', style: TextStyle(color: Colors.black54,fontSize: 13),),
                                        InkWell(
                                          child: Icon(Icons.add, color: amount == times.length ? Colors.grey[500] : Colors.black,),
                                          onTap: amount == times.length?null:() async {
                                            final time = await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                                builder: (context,child){
                                                  return Theme(
                                                    data: ThemeData.light().copyWith(colorScheme: ColorScheme.light().copyWith(primary: Colors.teal)),
                                                    child: child,
                                                  );
                                                }
                                            );
                                            if (time != null) {
                                              state(() => times.add(time));
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                    Wrap(
                                      spacing: 7,
                                      alignment: WrapAlignment.center,
                                      children: [
                                        for(var time in times)
                                          Chip(
                                            label: Text(time.format(context)),
                                            onDeleted: (){
                                              state(() => times.remove(time));
                                            },
                                            labelPadding: EdgeInsets.only(right: 5),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                    );
                  }
                ),
                SizedBox(height: 1.5.h,),
                StatefulBuilder(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: ()async{
                          range = await showDateRangePicker(context: context,
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
                              Text('مدة اخذ الدواء',style: TextStyle(color: Colors.black54,fontSize: 13),),
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
                SizedBox(height: 1.5.h,),
                Container(
                  height: 5.0.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200]
                  ),
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(7),
                  child: FutureBuilder<Doctor>(
                    future: widget.medicine == null ? null : db.getDoctor(widget.medicine.doctorId),
                    builder: (context, snapshot) {
                      doctor = snapshot.data;
                      return StatefulBuilder(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                doctor = await getDoctor();
                                state((){});
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 3.0.w),
                                child: Row(
                                  children: [
                                    Expanded(child: Center(
                                      child: Text(doctor?.name??"الطبيب المشرف",
                                        style: TextStyle(color: Colors.black54,fontSize: 12.0.sp,fontWeight: FontWeight.w600),),
                                    )),
                                    if(doctor != null)
                                    GestureDetector(
                                      onTap: (){
                                        doctor = null;
                                        state(() {});
                                      },
                                      child: Icon(Icons.cancel_outlined,color: Colors.red,))
                                  ],
                                ),
                              ),
                            );
                          }
                      );
                    }
                  ),
                ),
                StatefulBuilder(
                    builder: (context, state) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200]
                        ),
                        padding: EdgeInsets.only(right: 10),
                        margin: EdgeInsets.symmetric(vertical: 1.5.h),
                        clipBehavior: Clip.antiAlias,
                        child: CheckboxListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          value: isAfter,
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text("بعد الطعام"),
                          onChanged: (value) => state(()=>isAfter = value),
                        ),
                      );
                    }
                ),
                CustomTextField(
                  height: 100,
                  color: Colors.grey[200],
                  margin: EdgeInsets.zero,
                  expands: true,
                  maxLines: null,
                  onChanged: (value){
                    notes = value;
                  },
                  labelText: "ملاحظات",
                ),
                SizedBox(height: 2.5.h,),
                RaisedButton(
                  onPressed: () async {
                    if(controller.name.trim().isEmpty) {
                      controller.isNameValidController.add(false);
                      return;
                    } else if(widget.medicine == null &&
                        ((await db.getAllMedicines).any((element) => element.name.trim() == controller.name))){
                      showSnackBar('الدواء موجود من قبل');
                      return;
                    } else if(times.isEmpty){
                      showSnackBar('يرجى اضافة موعد تنبيه واحد على الاقل');
                      return;
                    } else if(doctor == null){
                      showSnackBar('يرجى تحديد الطبيب المشرف');
                      return;
                    }
                    bool isSuccess = await controller.saveMedicine(
                        id: widget.medicine?.id,amount: amount,
                        isAfter: isAfter,notes: notes, doctorId: doctor?.id,
                        range: range,unit: unit,times: times).catchError(print);
                    if(isSuccess){
                      Navigator.maybePop(context);
                    } else {
                      showSnackBar('عذرا حصل خطأ');
                    }
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Text(widget.medicine != null?'حفظ':"إضافة",style: TextStyle(color: Colors.white,height: 1)),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
