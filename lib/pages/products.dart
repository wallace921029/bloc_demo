import 'package:bloc_demo/bloc/car_bloc.dart';
import 'package:bloc_demo/pages/shopping_car.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> productList = [
      new Product(productName: '苹果', price: 8),
      new Product(productName: '香蕉', price: 3),
      new Product(productName: '葡萄', price: 12),
      new Product(productName: '进口李子', price: 20),
      new Product(productName: '山竹', price: 10),
    ];

    List<Widget> tiles = [];

    for (var item in productList) {
      tiles.add(new ListTile(
        title: new Text('${item.productName}'),
        subtitle: new Text('${item.price}元'),
        trailing: new Container(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () {
                  Provider.of<CarBloc>(context).setCarProduct(new CarProduct(product: item, number: 1));
                },
              ),
              new IconButton(
                icon: new Icon(Icons.remove),
                onPressed: () {
                  Provider.of<CarBloc>(context).setCarProduct(new CarProduct(product: item, number: 1));
                },
              )
            ],
          ),
        ),
      ));
      tiles.add(new Divider(height: 1));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('商品列表'),
      ),
      body: new Container(
        child: new ListView(
          children: tiles,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new ShoppingCar()
          ));
        },
      ),
    );
  }
}

class Product {
  String productName;
  num price;

  Product({this.productName, this.price});
}
