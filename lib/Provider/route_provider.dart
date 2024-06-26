import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerChangeNotifier = Provider<RouterNotifier>((ref) {
  return RouterNotifier();
});

class RouterNotifier extends ChangeNotifier {
  bool _isAuthed = false;
  bool _isRegistering = false;
  bool _isFirstTime = false;

  bool get isAuthed => _isAuthed;

  bool get isFirstTime => _isFirstTime;

  bool get isRegistering => _isRegistering;

  void setIsAuthed(bool value) {
    _isAuthed = value;
    notifyListeners();
  }

  void setIsRegistering(bool value) {
    _isRegistering = value;
    notifyListeners();
  }

  void setIsFirstTime(bool bool) {
    _isFirstTime = bool;
    //notifyListeners();
  }
}
