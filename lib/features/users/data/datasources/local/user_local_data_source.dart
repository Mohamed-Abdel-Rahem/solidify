import 'dart:convert';

import 'package:clean_arch/core/database/cache/cache_helper.dart';
import 'package:clean_arch/core/errors/expentions.dart';
import 'package:clean_arch/features/users/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cache;
  final String key = 'CachedUser';
  UserLocalDataSource({required this.cache});
  void cacheUser(UserModel? userToCache) {
    if (userToCache != null) {
      cache.saveData(key: key, value: jsonEncode(userToCache.toJson()));
    } else {
      throw CacheExeption(errorMessage: 'No Internet Connection');
    }
  }

  Future<UserModel?> getLastUser() {
    final jsonString = cache.getDataString(key: key);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: 'No Internet Connection');
    }
  }
}
