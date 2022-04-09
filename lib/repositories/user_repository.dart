import '../models/user.dart';

abstract class _UserRepositoryInterface {
  Future<List<User>?> fetchAllUsers({int? pageNumber,int? pageSize });
  Future<List<User>?> getAllUsers();

}

class UserRepository implements _UserRepositoryInterface{



  @override
  Future<List<User>?> fetchAllUsers({int? pageNumber, int? pageSize}) async {
    try{

    }catch(e){


    }


  }

  @override
  Future<List<User>?> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

}