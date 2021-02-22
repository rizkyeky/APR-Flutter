import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'injector.dart';
import 'theme.dart';

import 'view/page/page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.init();
  await injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APR',
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: textTheme,
        primaryColor: colorScheme['primary'],
        accentColor: colorScheme['accent1'],
        scaffoldBackgroundColor: colorScheme['background1'],
        canvasColor: colorScheme['background2'],
        buttonColor: colorScheme['primary'],
        hintColor: colorScheme['text2'],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EntryPage(),
    );
  }
}

