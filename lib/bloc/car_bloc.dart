import 'package:bloc_demo/pages/products.dart';
import 'package:rxdart/rxdart.dart';

class CarBloc {
  List<CarProduct> list = [];

  // 创建一个 steamController
  BehaviorSubject<List<CarProduct>> behaviorSubject =
      new BehaviorSubject<List<CarProduct>>();

  Observable<List<CarProduct>> get stream => behaviorSubject.stream;

  // 添加商品
  setCarProduct(CarProduct carProduct) {
    List<CarProduct> c = list.where((item) {
      return item.product.productName == carProduct.product.productName;
    }).toList();
    if (c.length == 0) {
      list.add(carProduct);
    } else {
      c[0].number++;
    }
    behaviorSubject.add(list);
  }

  // 减去商品
  minusCarProduct() {
  
  }

  void dispose() {
    behaviorSubject.close();
  }
}

class CarProduct {
  Product product;
  num number;

  CarProduct({this.product, this.number});
}
