import 'package:floor/floor.dart';


import '../models/user.dart';
import '../services/database_service.dart';


@Database(version: DatabaseService.version, entities: [
  User,
])
abstract class AppDatabase extends FloorDatabase {

}