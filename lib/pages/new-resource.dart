import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agri_app/crop-result/teff-result.dart';

class Language {
  Locale locale;
  String langName;
  Language({
    required this.locale,
    required this.langName,
  });
}

class AllInfo extends StatefulWidget {
  const AllInfo({super.key});

  @override
  State<AllInfo> createState() => _AllInfoState();
}

class _AllInfoState extends State<AllInfo> {
  final List<Map> myProducts =
      List.generate(15, (index) => {"id": index, "name": "Product $index"})
          .toList();
  final user = FirebaseAuth.instance.currentUser!;

  List<Language> languageList = [
    Language(
      langName: 'En',
      locale: const Locale('en'),
    ),
    Language(
      langName: 'አማ',
      locale: const Locale('am'),
    ),
  ];
  Language? selectedLang;

  @override
  Widget build(BuildContext context) {
    if (languageList.isNotEmpty) {
      selectedLang =
          languageList.singleWhere((e) => e.locale == context.locale);
    } else {
      print('list is empty');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'.tr()),
        actions: [
          //language button
          DropdownButton<Language>(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            iconSize: 35,
            elevation: 25,
            value: selectedLang,
            underline: Container(
              padding: const EdgeInsets.only(left: 1, right: 4),
            ),
            onChanged: (newValue) {
              setState(() {
                selectedLang = newValue!;
              });
              if (newValue!.langName == 'En') {
                context.setLocale(const Locale('en'));
              } else if (newValue.langName == 'አማ') {
                context.setLocale(const Locale('am'));
              } else {
                print('please select language');
              }
              // setState(() {});
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => Home()),
              // );
            },
            items:
                languageList.map<DropdownMenuItem<Language>>((Language value) {
              return DropdownMenuItem<Language>(
                value: value,
                child: Text(
                  value.langName,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent),
                ),
              );
            }).toList(),
          ),

          //logout icon
          IconButton(
            icon: Icon(Icons.logout_outlined),
            iconSize: 20,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('${user.email}'),
                      content: Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.pop(context);
                            ;
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
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
                background: Image.asset(
                  'assets/crop.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          // implement GridView.builder
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => teffResult(res: 'my teff')));
                  },
                  // child: Container(
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       color: Colors.amber,
                  //       borderRadius: BorderRadius.circular(15)),
                  //   child: Text(myProducts[index]["name"]),
                  // ),
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
                                "https://th.bing.com/th/id/OIP.6fedq9nlGdtwEU8Rj7g_AgHaFj?pid=ImgDet&rs=1"),
                            fit: BoxFit.cover,
                          ), //DecorationImage
                        ), //BoxDecoration
                        //Text
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 10, 8, 8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${myProducts[index]["name"]}',
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
                );
              }),
        ),
      ),
    );
  }
}
