import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mango_app/crop-result/barly-result.dart';

import '../crop-result/maize-result.dart';
import 'Resource.dart';

class CropFruit extends StatefulWidget {
  const CropFruit({super.key});

  @override
  State<CropFruit> createState() => _CropFruitState();
}

class _CropFruitState extends State<CropFruit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              // title: const Text('Tabs Demo'),
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                  // background: Image.asset(
                  //   'assets/crop.png',
                  //   fit: BoxFit.fitWidth,
                  // ),
                  ),
            ),
          ];
        },
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            // implement GridView.builder
            child:
             GridView(
              // scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Resource()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        //height: 100,
                        // width: 200,
                        height: MediaQuery.of(context).size.height / 2.5,
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://th.bing.com/th/id/R.feeeba7aafcc3b7cfa34e29e85e8c731?rik=pGl47741v5M6gw&pid=ImgRaw&r=0"),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mango',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => maizeResult(
                                  res: 'Maize',
                                )));
                  },
                  child: Stack(
                    children: [
                      Container(
                        //height: 100,
                        // width: 200,
                        height: MediaQuery.of(context).size.height / 2.5,
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://th.bing.com/th/id/R.9c1a6fbefecc645f7868cc60dd0f2ab6?rik=VxbSLhO2GiuVdg&riu=http%3a%2f%2fwww.keshrinandan.com%2fwp-content%2fuploads%2f2015%2f08%2fke_maize_top_producer.jpg&ehk=H1TPHg4aONC4883H7%2f8n0Iy6XYnaFAU6WgDNJT0Q8mA%3d&risl=&pid=ImgRaw&r=0"),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Maize',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => maizeResult(
                                  res: 'Teff',
                                )));
                  },
                  child: Stack(
                    children: [
                      Container(
                        //height: 100,
                        // width: 200,
                        height: MediaQuery.of(context).size.height / 2.5,
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://th.bing.com/th/id/R.42f1f28696d9ea2c8e8c7ff801e93e75?rik=nYarIbxZm9Ki3g&pid=ImgRaw&r=0"),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Teff',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => maizeResult(
                                  res: 'Wheat',
                                )));
                  },
                  child: Stack(
                    children: [
                      Container(
                        //height: 100,
                        // width: 200,
                        height: MediaQuery.of(context).size.height / 2.5,
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://th.bing.com/th/id/OIP.kbr-QB-x8J6TE74JymSwxQHaLH?pid=ImgDet&rs=1"),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wheat',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => barlyResult(
                                  res: 'Barley',
                                )));
                  },
                  child: Stack(
                    children: [
                      Container(
                        //height: 100,
                        // width: 200,
                        height: MediaQuery.of(context).size.height / 2.5,
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://th.bing.com/th/id/OIP.6iaLrjvK1xo_KuSAyN6jMgHaEo?pid=ImgDet&rs=1"),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Barley',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            )
            ),
     
      ),
    );
  }
}
