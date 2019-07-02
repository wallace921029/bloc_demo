import 'package:bloc_demo/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:bloc_demo/bloc/shop_bloc.dart';
import 'package:bloc_demo/pages/second_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new StreamBuilder<int>(
              initialData: 0,
              stream: Provider.of<ShopBloc>(context).stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return new Text('1号商品数量：${snapshot.data}');
              },
            ),
            new FlatButton(
              child: new Text('添加1号商品，每次加1'),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                Provider.of<ShopBloc>(context).increment();
              },
            ),
            new StreamBuilder<int>(
              initialData: Provider.of<CartBloc>(context).count,
              stream: Provider.of<CartBloc>(context).stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) => new Text('2号商品数量：${snapshot.data}'),
            ),
            new FlatButton(
              child: new Text('添加2号商品，每次加10'),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                Provider.of<CartBloc>(context).increment();
              },
            ),
            new FlatButton(
              child: new Text('goto next page'),
              textColor: Colors.white,
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new SecondPage();
                  }
                ));
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}