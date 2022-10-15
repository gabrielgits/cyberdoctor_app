import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> listSliderImage = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  final List<String> listSliderText = [
    'Before taking your device in repair, try the CyberDoctor',
    'Solution for various related problems',
    'Easy and free, you do not need to register',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = listSliderImage
        .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        listSliderText.elementAt(listSliderImage.indexOf(item)),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to CyberDoctor'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/problem');
            },
            icon: const Icon(Icons.search),
            label: const Text('Search Problem'),
          )
        ],
      ),
    );
  }
}
