import 'UserAPI.dart';
import 'UserModel.dart';

class UserRepository {
  UserAPI _api;
  UserRepository(this._api);

  Future<UserModel> fetchUser() async {
    UserModel user = await _api.getUserByID();
    return user;
  }
}
