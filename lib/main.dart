import 'package:amazing_quotes/screens/details_screen.dart';
import 'package:amazing_quotes/screens/quotes_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/categaory_screens.dart';
import 'screens/home_screen.dart';

void main(){

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const HomeScreen(),
        'category_screen' : (context) => const CategaoryScreen(),
        'details_screen' : (context) => const DetailsScreen(),
        'quotes_screen' : (context) => const QuotesScreen(),
      },
    ),
  );
}