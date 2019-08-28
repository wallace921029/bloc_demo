import 'package:bloc_demo/pages/products.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'bloc/car_bloc.dart';

void main() {
  return runApp(
    // 在顶层放置 Provider
    // new Provider<ShopBloc>(
    //   builder: (BuildContext context) => new ShopBloc(),
    //   child: new MyApp(),
    // )
    new MultiProvider(
      providers: <SingleChildCloneableWidget>[
        Provider<CarBloc>.value(value: new CarBloc())
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
      home: new Products()
    );
  }
}
