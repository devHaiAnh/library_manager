import 'dart:async';

import 'package:chamcongapp/validations/validations.dart';

class UpdateEmployeesStream {
  StreamController _user = StreamController.broadcast();
  StreamController _pass = StreamController.broadcast();
  StreamController _name = StreamController.broadcast();
  StreamController _address = StreamController.broadcast();
  StreamController _phone = StreamController.broadcast();
  Stream get usernameStream => _user.stream;
  Stream get passwordStream => _pass.stream;
  Stream get nameStream => _name.stream;
  Stream get addressStream => _address.stream;
  Stream get phoneStream => _phone.stream;

  void usernameChange(String username) {
    if (!Validations.isValidUser(username)) {
      _user.sink.addError("Nhập username chưa đúng chuẩn");
    } else {
      _user.sink.add("ok");
    }
  }

  void passwordChagne(String password) {
    if (!Validations.isValidPass(password)) {
      _pass.sink.addError("Nhập passowrd chưa đúng chuẩn");
    } else {
      _pass.sink.add("ok");
    }
  }

  void nameChange(String name) {
    if (!Validations.isValidUser(name)) {
      _name.sink.addError("Nhập tên chưa đúng chuẩn");
    } else {
      _name.sink.add("ok");
    }
  }

  void addressChange(String address) {
    if (!Validations.isValidText(address)) {
      _address.sink.addError("Nhập địa chỉ chưa đúng chuẩn");
    } else {
      _address.sink.add("ok");
    }
  }

  void phoneChange(int phone) {
    if (!Validations.isValidPhone(phone)) {
      _phone.sink.addError("Nhập số điện thoại chưa đúng chuẩn");
    } else {
      _phone.sink.add("ok");
    }
  }

  bool isValidInfo(
      {String name,
      String username,
      String password,
      String address,
      int phone}) {
    bool status = true;
    if (!Validations.isValidUser(username)) {
      status = false;
    } else if (!Validations.isValidPass(password)) {
      status = false;
    } else if (!Validations.isValidText(name)) {
      status = false;
    } else if (!Validations.isValidPhone(phone)) {
      status = false;
    } else if (!Validations.isValidText(address)) {
      status = false;
    }
    return status;
  }

  void dispose() {
    _user.close();
    _pass.close();
    _name.close();
    _address.close();
    _phone.close();
  }
}
