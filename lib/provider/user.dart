import 'package:epharmacy/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';


class UserProvider with ChangeNotifier {
  var _userBox = Hive.box('user');

  UserModel? _user;

  UserModel? get user => this._user;

  set user(UserModel? value) {
    this._user = value;
    _userBox.put('user', value!.toJson().toString());
    notifyListeners();
  }

  void getUserDataFromLocal() async {
    _user = _userBox.containsKey('user')
        ? UserModel.fromJson(_userBox.get('user'))
        : null;
    notifyListeners();
  }

  void getUserDataFromLocalWithoutNotify() async {
    _user = _userBox.containsKey('user')
        ? UserModel.fromJson(_userBox.get('user'))
        : null;
  }

  void signOut() {
    var _userBox = Hive.box('user');
    _userBox.clear();
    _user = null;
    notifyListeners();
    EasyLoading.showSuccess('Signed Out');
  }
}
class UserData {
  static UserModel? user;
}