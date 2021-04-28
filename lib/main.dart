import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hrlweibo/pages/splash_page.dart';
import 'package:flutter_hrlweibo/public.dart';
import 'package:fluro/src/router.dart' as fluroRouter;

void main() {
  runApp(new MyApp());
  if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xffffffff),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Color(0xffffffff),
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    );
     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = fluroRouter.Router();
    Routes.configureRoutes(router);
    Routes.router = router;

    return Container(
      child: MaterialApp(
          title: "HRL微博",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.white),
          onGenerateRoute: Routes.router.generator,
          home: SplashPage()),
    );
  }
}
