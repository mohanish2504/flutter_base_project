import 'package:flutter/foundation.dart';

class ApiUrls {
  static const String _baseUrl = (kReleaseMode ?  'https://localhost.production/' : 'https://localhost.developement/') + 'api/';
  static const String _users = 'user/';

  static String getBaseUrl() => _baseUrl;
  static String getAllUsers({int? pageNumber, int? pageSize}) {
    String url = _users;
    if(pageNumber!=null || pageSize!=null) url += '?';
    
    if (pageSize!=null) {
      url += 'pageSize=$pageSize';
    }

    if (pageNumber!=null) {
      url += 'pageNumber=$pageNumber';
    }
    
    return url; 
  }
  static String getUserById(String id){
    return _users + id;
  }
}