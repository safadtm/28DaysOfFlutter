import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _imagePaths = [
    'images/img1.jpg',
    'images/img2.jpg',
    'images/img3.jpg',
    'images/img4.jpg',
    'images/img5.jpg',
    'images/img6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Picture Carousel Example"),
          ),
          body: CarouselSlider(
            options: CarouselOptions(autoPlay: true),
            items: _imagePaths.map((imagePath) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(imagePath),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
