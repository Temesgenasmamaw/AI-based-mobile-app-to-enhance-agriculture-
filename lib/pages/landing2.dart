import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

//optional carousel page you can instead of landingPage
class landinPage2 extends StatelessWidget {
  const landinPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      // title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // a list of images' URLs
  final List data = [
    {
      "title": "Image 1",
      "url": "https://www.kindacode.com/wp-content/uploads/2022/07/bottle.jpeg"
    },
    {
      "title": "Image 2",
      "url":
          "https://www.kindacode.com/wp-content/uploads/2022/07/flower-4.jpeg"
    },
    {
      "title": "Image 3",
      "url":
          "https://www.kindacode.com/wp-content/uploads/2022/07/flower-3.jpeg"
    },
    {
      "title": "Image 4",
      "url":
          "https://www.kindacode.com/wp-content/uploads/2022/07/flower-1.jpeg"
    },
    {
      "title": "Image 5",
      "url":
          "https://cdn.pixabay.com/photo/2020/04/19/12/26/thread-5063401_960_720.jpg"
    },
    {
      "title": "Image 6",
      "url":
          "https://www.kindacode.com/wp-content/uploads/2022/07/flower-2.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/crop.png'),
              // image: AssetImage('assets/icons.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(top: 200),
          child: Column(
            children: [
              // Implement the image carousel
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 400),
                  height: 300,
                ),
                items: data.map((item) {
                  return GridTile(
                    footer: Container(
                        padding: const EdgeInsets.all(15),
                        color: Colors.black54,
                        child: Text(
                          item["title"],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.right,
                        )),
                    child: Image.network(item["url"], fit: BoxFit.cover),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              const Text(
                'Other Content',
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
