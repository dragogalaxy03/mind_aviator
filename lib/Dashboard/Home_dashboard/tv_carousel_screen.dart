
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TVCarouselSlider extends StatefulWidget {
  @override
  _TVCarouselSliderState createState() => _TVCarouselSliderState();
}

class _TVCarouselSliderState extends State<TVCarouselSlider> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  final List<String> imageList = [
    'https://staticg.sportskeeda.com/editor/2023/12/72cca-17023677113680-1920.jpg',
    'https://staticg.sportskeeda.com/editor/2023/12/3500c-17025379247060.png',
    'https://staticg.sportskeeda.com/editor/2023/12/a5754-17023659313934-1920.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Carousel Slider'),

      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.75,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imageList.map((imageUrl) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(Icons.error, color: Colors.red, size: 50),
                      );
                    },
                  ),
                ),
              );
            }).toList(),
          ),


          Positioned(
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key ? Colors.white : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}