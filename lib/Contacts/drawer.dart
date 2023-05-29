import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:mango_app/chatBot/chat.dart';
import 'package:provider/provider.dart';
import 'package:flutter_share/flutter_share.dart';
import '../Contacts/About.dart';
import '../Contacts/contact.dart';
import '../Contacts/privacy.dart';
import '../Contacts/rate-us.dart';
import '../databases/crop desc.dart';
import '../pages/new-resource.dart';
import '../theme/theme-model.dart';
import 'feedback.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        Container(
          color: Color(0xFF63031B),
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 70,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/crop.png'),
                  ),
                ),
              ),
              Text(
                "Smart Agri-app",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        ListTileSwitch(
          value: themeChange.darkTheme,
          leading: const Icon(Icons.dark_mode),
          onChanged: (value) {
            setState(() {
              themeChange.darkTheme = value;
            });
          },
          visualDensity: VisualDensity.comfortable,
          switchType: SwitchType.cupertino,
          switchActiveColor: Color(0xFFA10299),
          title: Text('DarkTheme'.tr()),
          subtitle: Text(
            "EnableDark".tr(),
          ),
        ),

        const Divider(
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),

        ListTile(
          title: Text('Chat Bot'.tr()),
          subtitle: Text("search in bot".tr()),
          leading: const Icon(Icons.chat),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Chat()),
            );
          },
        ),

        // ListTile(
        //   title: Text('Voice Bot'.tr()),
        //   subtitle: Text("search in bot".tr()),
        //   leading: const Icon(Icons.mic),
        //   onTap: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(builder: (context) => voiceChat()),
        //     );
        //   },
        // ),
        ListTile(
          title: Text('Crop info'.tr()),
          subtitle: Text("crop information".tr()),
          leading: const Icon(Icons.info_outline),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => cropsPrice()),
            );
          },
        ),

        ListTile(
          title: Text('resource'.tr()),
          subtitle: Text("all resource".tr()),
          leading: const Icon(Icons.info),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AllInfo()),
            );
          },
        ),

        ListTile(
          title: Text('About'.tr()),
          subtitle: Text("Aboutapp".tr()),
          leading: const Icon(Icons.contact_page),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const About()),
            );
          },
        ),
        ListTile(
          title: Text('Contact'.tr()),
          subtitle: Text(
            "contactus".tr(),
          ),
          leading: const Icon(Icons.contact_page),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Contact()),
            );
          },
        ),
        ListTile(
          title: Text('Feedback'.tr()),
          subtitle: Text(
            "GiveComment".tr(),
          ),
          leading: const Icon(Icons.feedback),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FeedbackScreen()),
            );
          },
        ),
        ListTile(
          title: Text('Share'.tr()),
          subtitle: Text(
            "share app".tr(),
          ),
          leading: const Icon(Icons.share),
          onTap: () {
            share();
          },
        ),

        const Divider(
          thickness: 3,
          indent: 10,
          endIndent: 10,
        ),
        Row(
          children: [
            // Icon(Icons.help),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Others'.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),

        ListTile(
          title: Text('RateUs'.tr()),
          subtitle: Text(
            "RateOurApp".tr(),
          ),
          leading: const Icon(Icons.rate_review),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Rate()),
            );
          },
        ),

        //********************************
        ListTile(
          title: Text('PrivacyPolicy'.tr()),
          subtitle: Text(
            "OurPrivacyPolicy".tr(),
          ),
          leading: const Icon(Icons.policy),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PrivacyPolicy()),
            );
          },
        ),
        ListTile(
          title: Text('Updates'.tr()),
          subtitle: Text(
            "Version".tr(),
          ),
          leading: const Icon(Icons.update),
          onTap: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'it is updated'.tr(),
                  style: const TextStyle(fontSize: 20),
                ),
                duration: const Duration(seconds: 5),
              ),
            );
          },
        )
      ],
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://play.google.com/store/apps?gl=us',
        chooserTitle: 'Example Chooser Title');
  }
}
