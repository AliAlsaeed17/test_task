import 'package:test_task/core/helpers/hive_helper.dart';

class UserLocalDataSource {
  final String tokenBox = 'token';
  final String userBox = ' user';

  Future<void> setUserToken(String token) async {
    try {
      await HiveHelper.openBox(tokenBox);
      await HiveHelper.saveData(tokenBox, token);
      await HiveHelper.closeBox();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String?> getUserToken() async {
    try {
      await HiveHelper.openBox(tokenBox);
      String? token = await HiveHelper.getData(tokenBox);
      await HiveHelper.closeBox();
      return token;
    } catch (e) {
      return null;
    }
  }

  Future<void> removeUserToken() async {
    try {
      await HiveHelper.openBox(tokenBox);
      await HiveHelper.removeData(tokenBox);
      await HiveHelper.closeBox();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> setUserId(int id) async {
    try {
      await HiveHelper.openBox(userBox);
      await HiveHelper.saveData(userBox, id);
      await HiveHelper.closeBox();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int?> getUserId() async {
    try {
      await HiveHelper.openBox(userBox);
      int? id = await HiveHelper.getData(userBox);
      await HiveHelper.closeBox();
      return id;
    } catch (e) {
      return null;
    }
  }

  Future<void> removeUserId() async {
    try {
      await HiveHelper.openBox(userBox);
      await HiveHelper.removeData(userBox);
      await HiveHelper.closeBox();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
