import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ai_agri/Authentication/login_page.dart';
import 'package:ai_agri/Authentication/registration_page.dart';
import 'package:ai_agri/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Screens/SignUp.dart';
import 'const/theme_data.dart';
import 'pages/info.dart';
import 'pages/prediction.dart';
import 'pages/home.dart';
import 'theme/theme-model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('am'),
        Locale('en'),
        // Locale('es'),
        // Locale('fr')
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      // fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

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
            // localizationsDelegates:context.GlobalMaterialLocalizations.delegets,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: messengerKey,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(),
              '/home': (context) => const Home(),
              '/info': (context) => const Info(),
              '/Prediction': (context) => const Prediction(),
              '/login': (context) => const LoginPage(),
              '/register': (context) => const RegistrationPage(),
            },
          );
        }));
  }
}
