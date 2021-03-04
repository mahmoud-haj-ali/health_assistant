import 'package:flutter/material.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:haelth_app/features/home/presintation/widget/main_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        primary: true,
        body: body(),
      ),
    );
  }

  Widget body(){
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: MediaQuery.of(context).size.height*0.6,
          right: 0,
          left: 0,
          child: Container(color: Colors.teal)),
        Positioned.fill(
          child: Column(
            children: [
              header(),
              SizedBox(height: 10,),
              buttons()
            ],
          ),
        ),
      ],
    );
  }

  Widget header(){
    return SizedBox(
      height: 130,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("المساعد الصحي",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white,),),
                  SizedBox(height: 10,),
                  Text("يساعدك هذا التطبيق في جدولة مواعيد الأطباء لديك، ومواعيد جرعات الدواء، والحميات المتبعة، وكافة التحاليل التي قمت بعملها.",
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white,letterSpacing: 2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(Icons.favorite_outline_outlined,color: Colors.white,size: 40,),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttons(){
    return Expanded(
      child: Column(
        children: [
          Expanded(flex:1,child: MainCard(text: "الأدوية",onPressed: (){
            Navigator.pushNamed(context, NameScreen.MEDICINES_LIST_PAGE);
          },imageName: "medicine.jpg",color: Colors.red.shade900,)),
          Expanded(flex:1,child: MainCard(text: "الأطباء",onPressed: (){
            Navigator.pushNamed(context, NameScreen.DOCTORS_LIST_PAGE);
          },imageName: "doctors.jpg",color: Colors.lightBlue.shade900,)),
          Expanded(flex:1,child: MainCard(text: "الحميات",onPressed: (){},imageName: "diet.jpg",color: Colors.green.shade900,)),
          Expanded(flex:1,child: MainCard(text: "التحاليل",onPressed: (){},imageName: "analysis.jpg",color: Colors.cyan.shade900,)),
        ],
      ),
    );
  }
}
