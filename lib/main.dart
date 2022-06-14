import 'package:flutter/material.dart';
import 'package:link_chaldal/Screens/splash.dart';
import 'package:provider/provider.dart';

import 'cart/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
         return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
        home: Splash());

      }),
    );
   
  }
}
