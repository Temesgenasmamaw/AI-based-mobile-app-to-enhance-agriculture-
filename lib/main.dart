import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mango_app/pages/splash.dart';
//import 'package:mango_final/pages/language.dart';
// import 'package:mango_app/pages/splash.dart';
import 'package:provider/provider.dart';

import 'const/theme_data.dart';
import 'pages/info.dart';
import 'pages/prediction.dart';
import 'pages/home.dart';
import 'theme/theme-model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('am'),
        Locale('en'),
        Locale('es'),
        Locale('fr')
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      // fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/home': (context) => const Home(),
              '/info': (context) => const Info(),
              '/Prediction': (context) => const Prediction(),
            },
          );
        }));
  }
}
