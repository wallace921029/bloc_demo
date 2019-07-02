# Flutter BLoC
BLoC - Business Logic Component  
事务逻辑与 UI 分离的开发方式。其中 Provider 是官方推荐的状态管理方式。  

[参考文章](https://juejin.im/post/5cdee8a151882525b21a5f9e#heading-4)

## 依赖
在 dependencies 中添加依赖：[rxdart](https://pub.flutter-io.cn/packages/rxdart)、[provider](https://pub.flutter-io.cn/packages/provider)
```
rxdart: 0.22.0
provider: 3.0.0+1
```

## 声明 BLoC
先声明2个 Bloc，以下声明了 ShopBloc 和 CartBloc
```dart
import 'package:rxdart/rxdart.dart';

class ShopBloc{
  // 内置
  int _count = 0;

  // 声明流控制器
  BehaviorSubject<int> _behaviorSubject =  new BehaviorSubject<int>();
  // 声明可观察对象
  Observable<int> get stream => _behaviorSubject.stream;

  // 增加 count 值，然后出发流控制器
  increment() {
    _count++;
    _behaviorSubject.sink.add(_count);
  }

  void dispose() {
    print('excuse dispose fuction ~');
    _behaviorSubject.close();
  }
}
```
```dart
import 'package:rxdart/rxdart.dart';

class CartBloc {
  int _count = 10000;

  BehaviorSubject<int> _behaviorSubject = new BehaviorSubject<int>();
  Observable<int> get stream => _behaviorSubject.stream;

  int get count => _count;

  increment() {
    _count += 100;
    _behaviorSubject.add(_count);
  }

  void dispose(){
    _behaviorSubject.close();
  }
}
```

## 在顶层放置 Provider
```dart
void main() {
  return runApp(
    // 在顶层放置 Provider
    // 单个 Provider
    // new Provider<ShopBloc>(
    //   builder: (BuildContext context) => new ShopBloc(),
    //   child: new MyApp(),
    // )
    
    // 多个 Provider
    new MultiProvider(
      providers: <SingleChildCloneableWidget>[
        Provider<ShopBloc>.value(value: new ShopBloc()),
        Provider<CartBloc>.value(value: new CartBloc())
      ],
      child: new MyApp(),
    )
  );
}
```

## 使用 Provider
```dart
// ...省略其他代码
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
```