import 'package:amazing_quotes/models/quotes_models.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          '${args.name}',
          style: const TextStyle(letterSpacing: 2),
        ),
      ),
      body: FutureBuilder(
        future: args.fetchAllData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR:- ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Map<String, dynamic>> data = snapshot.data;

            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: data.length - 1,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {

                    Navigator.of(context).pushNamed('quotes_screen',arguments: Quotes(name: args.name, quotes: '${data[i+1][args.myData]}'));

                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 0),
                              spreadRadius: 0,
                              blurRadius: 10,
                            ),
                          ],
                        ),

                        alignment: Alignment.center,

                        child: Column(
                          children: [

                            const SizedBox(height: 50),

                            SizedBox(width: 300,child: Text('${data[i+1][args.myData]}',textAlign: TextAlign.center,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500,letterSpacing: 1),),),
                            const SizedBox(height: 70),

                            Padding(
                              padding: const EdgeInsets.only(right: 100,left: 100),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(Icons.checklist,color: Colors.grey),
                                  Icon(Icons.star,color: Colors.grey),
                                  Icon(Icons.copy,color: Colors.grey),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),

                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20,);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
