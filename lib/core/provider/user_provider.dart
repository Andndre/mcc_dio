import 'package:flutter/material.dart';
import 'package:myapp/core/model/user_model.dart';
import 'package:myapp/core/service/user_service.dart';

class UserProvider with ChangeNotifier {
  List<UserModel>? _users;
  bool _isLoading = false;

  List<UserModel>? get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers({int page = 1}) async {
    if (_users != null) return; // Cegah fetch ulang jika data sudah ada

    _isLoading = true;
    notifyListeners();

    _users = await UserService().getUser(page: page);

    _isLoading = false;
    notifyListeners();
  }
}
