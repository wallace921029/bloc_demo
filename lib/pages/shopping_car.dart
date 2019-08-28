import 'package:bloc_demo/bloc/car_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCar extends StatelessWidget {
  const ShoppingCar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物车'),
      ),
      body: new StreamBuilder<List<CarProduct>>(
        initialData: [],
        stream: Provider.of<CarBloc>(context).stream,
        builder: (BuildContext buildContext, AsyncSnapshot<List<CarProduct>> snapshot) {
          print(snapshot.data);
          return new ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return new ListTile(
                title: new Text('${snapshot.data[index].product.productName}'),
                subtitle: new Text('${snapshot.data[index].number}'),
              );
            });
        },
      ),
    );
  }
}