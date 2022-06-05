
import 'package:amazing_quotes/utils/colors.dart';
import 'package:flutter/material.dart';

import '../helpers/quotes_helpers.dart';
import '../models/quotes_models.dart';

class CategaoryScreen extends StatefulWidget {
  const CategaoryScreen({Key? key}) : super(key: key);

  @override
  State<CategaoryScreen> createState() => _CategaoryScreenState();
}

class _CategaoryScreenState extends State<CategaoryScreen> {


  @override
  Widget build(BuildContext context) {

    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar:AppBar(
        backgroundColor: mainColor,
        title: const Text(
        'Amazing Quotes',
        style: TextStyle(letterSpacing: 2),
    ),),
      body: FutureBuilder(
        future: args,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError)
          {
            return Center(child: Text("ERROR:- ${snapshot.error}"),);
          }
          else if(snapshot.hasData)
          {
            List<Map<String,dynamic>> data = snapshot.data;
            return ListView.builder(physics: const BouncingScrollPhysics(),itemCount: categoryNames.length,itemBuilder: (context,i){

              return GestureDetector(
                onTap: (){

                  Navigator.of(context).pushNamed('details_screen',arguments: Details(id: i, name: categoryNames[i], fetchAllData: args, myData: myData[i]));

                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: categoryColors[i],
                        ),
                        alignment: Alignment.center,
                        child: Text("${categoryNames[i][0].toUpperCase() + categoryNames[i][1].toUpperCase()} ",style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500),),
                      ),
                      const SizedBox(width: 30,),
                      SizedBox(
                        width: 250,
                        child: Text(categoryNames[i] ,style: const TextStyle(fontSize: 19),
                        ),
                      ),
                    ],
                  ),
                ),
              );

            },);
          }
            return const Center(child: CircularProgressIndicator(),);

        },

      ),
    );
  }
}

