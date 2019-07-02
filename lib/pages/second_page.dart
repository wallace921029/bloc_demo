import 'package:bloc_demo/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:bloc_demo/bloc/shop_bloc.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(),
       body: new StreamBuilder<int>(
        initialData: 0,
        stream: Provider.of<ShopBloc>(context).stream, 
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text('你已经购买1号商品：${snapshot.data}'),
                new FlatButton(
                  child: new Text('添加1号商品1件，2号商品10件'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Provider.of<ShopBloc>(context).increment();
                    Provider.of<CartBloc>(context).increment();
                  },
                ),
              ],
            )
          );
        },
      ),
    );
  }
}