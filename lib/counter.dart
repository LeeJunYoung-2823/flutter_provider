import 'package:flutter/material.dart';

// 변경 통제 기능
class Counter with ChangeNotifier {
  // ChangeNotifier 오브젝트 같이 사용
  int _count = 0;
  int test = 0;

  int get count => _count;
//  int getCount(){
//    return _count;
//  }

  void increment() {
    _count++;
    notifyListeners(); // 상태가 변했을 때 다른 곳에서 감지 가능 (ChangeNotifier)
  }
}
