import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details {
  final int? id;
  final String? name;
  final String? myData;
  Future<List<Map<String, dynamic>>> fetchAllData;

  Details({
    required this.id,
    required this.name,
    required this.myData,
    required this.fetchAllData,
  });
}

class Quotes {
  final String? name;
  final String? quotes;

  Quotes({
    required this.name,
    required this.quotes,
  });
}

List<String> sliderImage = <String>[
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
  "https://cdn.pixabay.com/photo/2013/07/18/10/56/railroad-163518__340.jpg",
  "https://cdn.pixabay.com/photo/2016/10/18/21/28/seljalandsfoss-1751463__340.jpg",
  "https://cdn.pixabay.com/photo/2016/08/11/23/48/mountains-1587287__340.jpg",
  "https://cdn.pixabay.com/photo/2015/10/30/20/13/sunrise-1014712__340.jpg",
  "https://cdn.pixabay.com/photo/2013/11/28/10/03/river-219972__340.jpg",
  "https://cdn.pixabay.com/photo/2017/10/10/07/48/hills-2836301_960_720.jpg",
];

List myData = [
  "life_quotes",
  "motivational_quotes",
  "love_quotes",
  "happiness_quotes",
  "swami_vivekananda_quotes",
  "albert_einstein_quotes",
  "helen_keller_quotes",
  "success_quotes",
  "dr_seuss_quotes",
];

List categoryNames = [
  "Life Quotes",
  "Motivational Quotes",
  "Love Quotes",
  "Happiness Quotes",
  "Swami Vivekananda Quotes",
  "Albert Einstein Quotes",
  "Helen Keller Quotes",
  "Success Quotes",
  "Dr.Seuss Quotes",
];

List categoryColors = [
  Colors.green,
  Colors.amber,
  Colors.pink,
  Colors.brown,
  Colors.green,
  Colors.amber,
  Colors.pink,
  Colors.brown,
  Colors.amber,
];

List categoryList = [
  [
    "The purpose of our lives is to be happy.",
    "When you have a dream, you’ve got to grab it and never let go.",
    'When you have a dream, you’ve got to grab it and never let go.',
    'There is nothing impossible to they who will try',
    'The bad news is time flies. The good news is you’re the pilot.',
    "Life has got all those twists and turns. You’ve got to hold on tight and off you go.",
    'Keep your face always toward the sunshine, and shadows will fall behind you.',
    'Success is not final, failure is not fatal: it is the courage to continue that counts',
    'You define your own life. Don’t let other people write your script.'
  ],
  [
    "Life is what happens when you’re busy making other plans.",
    "Love is that condition in which the happiness of another person is essential to your own.",
    "The best thing to hold onto in life is each other",
    "I need you like a heart needs a beat"
  ],
  [
    "Many of life’s failures are people who did not realize how close they were to success when they gave up.",
    "I am who I am because of you. You are every reason, every hope, and every dream I’ve ever had.",
    "If I had a flower for every time I thought of you… I could walk through my garden forever",
    "The purpose of our lives is to be happy.",
    "Life is what happens when you’re busy making other plans",
    "Get busy living or get busy dying",
    "You only live once, but if you do it right, once is enough.",
    "If you want to live a happy life, tie it to a goal, not to people or things",
    "Money and success don’t change people; they merely amplify what is already there"
  ],
  [
    "Get busy living or get busy dying.",
    "If you think yourselves strong, strong you will be",
    "Meditation can turn fools in to sages but unfortunately fools never meditate",
    "That man has reached immortality who is disturbed by nothing material",
    "You should work like a master and not as a slave; work incessantly, but do not do a slave’s work",

  ],
];

Map<String, Color> myColorName = {
  "Life Quotes": Colors.green,
  "Motivational Quotes": Colors.amber,
  "Love Quotes": Colors.pink,
  "Happiness Quotes": Colors.green,
};

class Detail {
  int? id;
  String? quote;

  Detail({
    this.id,
    required this.quote,
  });

  factory Detail.fromMap(Map<String, dynamic> data) {
    return Detail(
      id: data['id'],
      quote: data['quote'],
    );
  }
}

int j = 0;

List mainFonts = [
  GoogleFonts.abel(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
  GoogleFonts.adamina(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
  GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
  GoogleFonts.handlee(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
  GoogleFonts.bakbakOne(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
];

List subFonts = [
  GoogleFonts.abel(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
  GoogleFonts.adamina(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
  GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
  GoogleFonts.handlee(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
  GoogleFonts.bakbakOne(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  ),
];
