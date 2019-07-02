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