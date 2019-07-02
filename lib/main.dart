import 'package:bloc_demo/bloc/cart_bloc.dart';
import 'package:bloc_demo/bloc/shop_bloc.dart';
import 'package:flutter/material.dart';

import 'package:bloc_demo/pages/first_page.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    // 在顶层放置 Provider
    // new Provider<ShopBloc>(
    //   builder: (BuildContext context) => new ShopBloc(),
    //   child: new MyApp(),
    // )
    new MultiProvider(
      providers: <SingleChildCloneableWidget>[
        Provider<ShopBloc>.value(value: new ShopBloc()),
        Provider<CartBloc>.value(value: new CartBloc())
      ],
      child: new MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FirstPage()
    );
  }
}
