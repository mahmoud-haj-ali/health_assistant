import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
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
      if(widget.medicine.startDate != null){
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
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    color: Colors.grey[200],
                    controller: TextEditingController(text: widget.medicine?.name),
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
                        if(!snapshot.data)
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Align(alignment:Alignment(0.95,0.0),
                                child: Text("يرجى إدخال اسم",style: TextStyle(color: Colors.red,fontSize: 12,height: 0.5),)),
                          );
                        return SizedBox(height: 0,);
                      }
                  ),
                  SizedBox(height: 15,),
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
                                                  decoration: BoxDecoration(
                                                    // border: Border.all(color: Colors.black38),
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            if(amount>1)
                                                              state(()=>amount--);
                                                            if(amount == times.length - 1)
                                                              times.removeLast();
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
                                                      isDense: true,
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
                                SizedBox(height: 15,),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black38),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey[200]
                                  ),
                                  clipBehavior: Clip.antiAlias,
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
                  SizedBox(height: 15,),
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
                  StatefulBuilder(
                      builder: (context, state) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200]
                          ),
                          padding: EdgeInsets.only(right: 10),
                          margin: EdgeInsets.symmetric(vertical: 15),
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
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: Builder(
                        builder: (context) {
                          return RaisedButton(
                            onPressed: () async {
                              if(controller.name.isEmpty) {
                                controller.isNameValidController.add(false);
                                return;
                              }
                              bool isSuccess = await controller.saveMedicine(id: widget.medicine?.id,amount: amount,isAfter: isAfter,notes: notes,range: range,unit: unit,times: times);
                              if(isSuccess){
                                Navigator.pop(context);
                              } else {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('عذرا حصل خطأ',
                                      style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),),
                                      duration: Duration(seconds: 1),
                                      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    ));
                              }
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Text(widget.medicine != null?'حفظ':"إضافة",style: TextStyle(color: Colors.white,height: 1)),
                            color: Theme.of(context).primaryColor,
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
