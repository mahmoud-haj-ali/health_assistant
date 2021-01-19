import 'package:flutter/material.dart';
import 'package:haelth_app/features/home/presintation/widget/main_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Health assistant"),
      ),
      body: body(),
    );
  }

  Widget body(){
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(flex:1,child: MainCard(text: "الأدوية",onPressed: (){},imageName: "medicine.jpg",color: Colors.red,)),
              Expanded(flex:1,child: MainCard(text: "الأطباء",onPressed: (){},imageName: "doctors.jpg",color: Colors.red,)),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(flex:1,child: MainCard(text: "الحميات",onPressed: (){},imageName: "diet.jpg",color: Colors.red,)),
              Expanded(flex:1,child: MainCard(text: "التحاليل",onPressed: (){},imageName: "analysis.jpg",color: Colors.red,)),
            ],
          ))
      ],
    );
  }

}
