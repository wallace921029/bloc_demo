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