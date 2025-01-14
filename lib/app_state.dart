import 'package:flutter/material.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
  }

  dynamic _operator;
  dynamic get operator => _operator;
  set operator(dynamic value) {
    _operator = value;
  }

  dynamic _snowOperation;
  dynamic get snowOperation => _snowOperation;
  set snowOperation(dynamic value) {
    _snowOperation = value;
  }

  bool _isResponseValid = false;
  bool get isResponseValid => _isResponseValid;
  set isResponseValid(bool value) {
    _isResponseValid = value;
  }

  List<int> _currentDate = [];
  List<int> get currentDate => _currentDate;
  set currentDate(List<int> value) {
    _currentDate = value;
  }

  void addToCurrentDate(int value) {
    currentDate.add(value);
  }

  void removeFromCurrentDate(int value) {
    currentDate.remove(value);
  }

  void removeAtIndexFromCurrentDate(int index) {
    currentDate.removeAt(index);
  }

  void updateCurrentDateAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    currentDate[index] = updateFn(_currentDate[index]);
  }

  void insertAtIndexInCurrentDate(int index, int value) {
    currentDate.insert(index, value);
  }

  List<dynamic> _currentLocation = [];
  List<dynamic> get currentLocation => _currentLocation;
  set currentLocation(List<dynamic> value) {
    _currentLocation = value;
  }

  void addToCurrentLocation(dynamic value) {
    currentLocation.add(value);
  }

  void removeFromCurrentLocation(dynamic value) {
    currentLocation.remove(value);
  }

  void removeAtIndexFromCurrentLocation(int index) {
    currentLocation.removeAt(index);
  }

  void updateCurrentLocationAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    currentLocation[index] = updateFn(_currentLocation[index]);
  }

  void insertAtIndexInCurrentLocation(int index, dynamic value) {
    currentLocation.insert(index, value);
  }
}
