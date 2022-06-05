import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

import '../models/quotes_models.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();

}

class _QuotesScreenState extends State<QuotesScreen> {
  int imageIndex = 0;
  int fontIndex = 0;

  bool starEnable = false;

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  sliderImage[imageIndex],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        '${args.quotes}',
                        textAlign: TextAlign.center,
                        style: mainFonts[fontIndex],
                      ),
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: 300,
                      child: Text(
                        '- ${args.name}',
                        textAlign: TextAlign.center,
                        style: subFonts[fontIndex],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 100, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          imageIndex++;

                          if (imageIndex > 6) {
                            imageIndex = 0;
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          fontIndex++;

                          if (fontIndex > 4) {
                            fontIndex = 0;
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.font_download,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        ClipboardData data =
                            ClipboardData(text: '${args.quotes}');
                        await Clipboard.setData(data);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.black,
                            content: Text('Text Copied...',style: TextStyle(color: Colors.white),),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Share.share(
                            '${args.quotes}');
                      },
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          starEnable = !starEnable;
                        });
                      },
                      icon: Icon(
                        Icons.star,
                        color: (starEnable) ? Colors.amber : Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
