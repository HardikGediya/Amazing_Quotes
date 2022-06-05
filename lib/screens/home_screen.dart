import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../helpers/quotes_helpers.dart';
import '../models/quotes_models.dart';
import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  CarouselController carouselController = CarouselController();

  int index = 0;

  Future<List<Map<String,dynamic>>> fetchData = DBHelper.dbHelper.fetchData();

  insertDetail() async{

    // await DBHelper.dbHelper.deleteAllData();

    for(int i=0; i<myData.length; i++){

      await DBHelper.dbHelper.insertData(cat0: categoryList[i][0],cat1: categoryList[i][1],cat2: categoryList[i][2],cat3: categoryList[i][3]);

    }


  }

  @override
  void initState() {
    super.initState();
    insertDetail();
    fetchData = DBHelper.dbHelper.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Amazing Quotes',
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      // autoPlay: true,
                        onPageChanged: (i, _) {
                          setState(() {
                            index = i;
                          });
                        },
                        height: 260.0,
                        enlargeCenterPage: true,
                        viewportFraction: 1),
                    items: sliderImage.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                  image: NetworkImage(i), fit: BoxFit.cover),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const Text(
                        'MAY YOU',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                      ),
                      const Text(
                        'ALWAYS',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 45,
                            letterSpacing: 2),
                      ),
                      const Text(
                        'DO WHAT YOU ARE AFRAID TO DO',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: sliderImage
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor:
                                      (index == sliderImage.indexOf(e))
                                          ? Colors.redAccent
                                          : Colors.white,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 260,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                      child: Text(
                        'Most Popular',
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed('quotes_screen',arguments: Quotes(name: 'Love Quotes', quotes: 'I love you and that’s the beginning and end of everything'));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: 100,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              alignment: Alignment.center,
                              child: const SizedBox(
                                  width: 120,
                                  child: Text(
                                    'Love Quotes',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed('quotes_screen',arguments: Quotes(name: 'Swami Vivekananda Quotes', quotes: "Swami Vivekananda Quotes 1"));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: 100,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.redAccent,
                              ),
                              alignment: Alignment.center,
                              child: const SizedBox(
                                width: 120,
                                child: Text(
                                  'Swami Vivekananda Quotes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed('quotes_screen',arguments: Quotes(name: 'Albert Einstein Quotes', quotes: "Albert Einstein Quotes 1"));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: 100,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                              ),
                              alignment: Alignment.center,
                              child: const SizedBox(
                                  width: 120,
                                  child: Text(
                                    'Albert Einstein Quotes',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed('quotes_screen',arguments: Quotes(name: 'Motivational Quotes', quotes: "Keep your face always toward the sunshine, and shadows will fall behind you."));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: 100,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              alignment: Alignment.center,
                              child: const SizedBox(
                                  width: 120,
                                  child: Text(
                                    'Motivational Quotes',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 10, bottom: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Quotes by Category',
                            style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed : (){
                                Navigator.of(context).pushNamed('category_screen',arguments: fetchData);
                            },
                            child: const Text('Show All',style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey), ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: myColorName.entries
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  height: 125,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: e.value,
                                  ),
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 120,
                                    child: Text(
                                      e.key,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 260,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                      child: Text(
                        'Quotes by Author',
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 100,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            alignment: Alignment.center,
                            child: const SizedBox(
                                width: 120,
                                child: Text(
                                  'Albert Einstein Quotes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 100,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange,
                            ),
                            alignment: Alignment.center,
                            child: const SizedBox(
                              width: 120,
                              child: Text(
                                'Swami Vivekananda Quotes',
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 100,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.brown,
                            ),
                            alignment: Alignment.center,
                            child: const SizedBox(
                                width: 120,
                                child: Text(
                                  'Helen Keller Quotes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 100,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent,
                            ),
                            alignment: Alignment.center,
                            child: const SizedBox(
                                width: 120,
                                child: Text(
                                  'Dr.Seuss Quotes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 260,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                      child: Text(
                        'Featured',
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 100,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                            ),
                            alignment: Alignment.center,
                            child: const SizedBox(
                                width: 120,
                                child: Text(
                                  'Success Quotes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 100,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange.shade400,
                            ),
                            alignment: Alignment.center,
                            child: const SizedBox(
                              width: 120,
                              child: Text(
                                'Life Quotes',
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 100,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.lightGreen,
                            ),
                            alignment: Alignment.center,
                            child: const SizedBox(
                                width: 120,
                                child: Text(
                                  'Sad Quotes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 100,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.teal,
                            ),
                            alignment: Alignment.center,
                            child: const SizedBox(
                                width: 120,
                                child: Text(
                                  'Dr.Seuss Quotes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

