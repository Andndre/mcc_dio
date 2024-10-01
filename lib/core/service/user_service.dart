import 'package:dio/dio.dart';
import 'package:myapp/core/model/user_model.dart';

class UserService {
  Dio dio = Dio();

  Future<List<UserModel>> getUser({int page = 1}) async {
    try {
      Response response =
          await dio.get('https://reqres.in/api/users?page=$page');
      if (response.statusCode != 200) {
        return [];
      }
      return UsersResponse.fromJson(response.data).data;
    } catch (e) {
      return [];
    }
  }
}
