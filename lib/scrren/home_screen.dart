import 'dart:convert';

import 'package:azkar/models/section_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SectionModel>sections = [];
@override
  void initState() {
    super.initState();
    loadSection();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "اذكار المسلم",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sections.length,
          itemBuilder: (context,index)=> buildSectionItem(text: sections[index].name!),
        ),
      ),
    );
  }

  Widget buildSectionItem({required String text}){
    return InkWell(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        width: double.infinity,
        height: 100,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.lightGreenAccent,
              Colors.green,
            ],
          ),
        ),
        child:  Text(text,style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),),
      ),
    );
  }
  loadSection()async{
  DefaultAssetBundle.of(context).loadString("assets/section_db.json").then((data) {
    var response = json.decode(data);
    response.forEach((section){
      SectionModel _section = SectionModel.fromJson(section);
      sections.add(_section);
    });
    setState(() {

    });
  }).catchError((error){
    print(error);
  });
  }
}
