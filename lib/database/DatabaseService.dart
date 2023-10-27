import 'package:path/path.dart';
import 'package:ft_practice/api/Constants.dart';
import 'package:ft_practice/database/model/Place.dart';
import 'package:ft_practice/database/model/Users.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final String _DB_NAME = "ft_practice.db";
  final String _DB_TABLE_USERS = "users";
  final String _DB_TABLE_PLACE = "place";

  static final DatabaseService _database = DatabaseService._internal();
  late Future<Database> database;

  factory DatabaseService() => _database;

  DatabaseService._internal() {
    databaseConfig();
  }

  databaseConfig() async {
    try {
      database = openDatabase(
        join(await getDatabasesPath(), _DB_NAME),
        onCreate: (db, version) => _createTable(db),
        onUpgrade: _onUpgrade,
        version: 1,
      );
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  _createTable(Database db) async {
    db.execute('CREATE TABLE users(id TEXT PRIMARY KEY, '
        'password TEXT)');

    db.execute('CREATE TABLE place ('
        'no INTEGER PRIMARY KEY AUTOINCREMENT,'
        'id TEXT,'
        'place_id TEXT,'
        'address TEXT,'
        'name TEXT)');
    addPlaces();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {}
  }

  Future<bool> addPlaces() async {
    final Database db = await database;
    try {
      db.rawInsert(
          'INSERT INTO place(id, name, place_id, address) VALUES("0", "비자림", "ChIJF50tCzMXDTURJM1q9jLS7Xs", "제주특별자치도 제주시 구좌읍 비자숲길 55")');
      db.rawInsert(
          'INSERT INTO place(id, name, place_id, address) VALUES("0", "화담숲", "ChIJA9lRtLGqfDURyWWCAEvlS_A", "경기도 광주시 도척면 도척윗로 278")');
      db.rawInsert(
          'INSERT INTO place(id, name, place_id, address) VALUES("1", "올림픽공원", "ChIJg_TYDmGlfDURb6IVCHwVOF4", "서울특별시 송파구 올림픽로 424")');
      db.rawInsert(
          'INSERT INTO place(id, name, place_id, address) VALUES("1", "보라매공원", "ChIJF6qEv7qffDURDbI8B6FcJ2Q", "서울특별시 동작구 여의대방로20길 33")');
      db.rawInsert(
          'INSERT INTO place(id, name, place_id, address) VALUES("0", "죽녹원", "ChIJe8P5p_LqcTURrVA5YOtPKRk", "전라남도 담양군 담양읍 죽녹원로 119")');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> getAllDatas() async {
    Map<String, dynamic> _datas = {};
    List<Place> places = await getAllPlaces();
    _datas[LIST_KEY_PLACE] = places;

    return _datas;
  }

  Future<bool> updateUserPassword(Users user, String newPassword) async {
    final Database db = await database;
    try {
      bool isValidate = await loginValidation(user);

      if (!isValidate) {
        return false;
      }

      Map<String, dynamic> pwUserData =
          Users(id: user.id, password: newPassword).toMap();

      print("pwUserData.toString ${pwUserData.toString()}");
      db.update(
        _DB_TABLE_USERS, // table name
        pwUserData,
        where: 'id = ?',
        whereArgs: ["user.id]"],
      );

      return true;
    } catch (e) {
      print("updateUserPassword() e: $e");
      return false;
    }
  }

  Future<Users> getUser(id) async {
    final Database db = await database;
    try {
      final List<Map<String, dynamic>> data =
          await db.query(_DB_TABLE_USERS, where: "id = ?", whereArgs: [id]);
      return Users(id: data[0]['id'], password: data[0]['password']);
    } catch (e) {
      print("getUser() e: $e");
      return Users(id: "", password: "");
    }
  }

  Future<List<Users>> getUserList() async {
    final Database db = await database;
    final List<Map<String, dynamic>> data = await db.query('users');

    return List.generate(data!.length, (i) {
      return Users(
        id: data[i]['id'],
        password: data[i]['password'],
      );
    });
  }

  Future<bool> isAlreadyJoined(id) async {
    final Database db = await database;
    try {
      final List<Map<String, dynamic>> data =
          await db.query(_DB_TABLE_USERS, where: "id = ?", whereArgs: [id]);
      if (id == data[0]['id']) {
        return true;
      }
      return false;
    } catch (e) {
      print("isAlreadyJoined() e: $e");
      return false;
    }
  }

  Future<bool> loginValidation(Users user) async {
    final Database db = await database;
    try {
      final List<Map<String, dynamic>> data = await db
          .query(_DB_TABLE_USERS, where: "id = ?", whereArgs: [user.id]);
      if (user.password == data[0]['password']) {
        return true;
      }
      print("loginValidation false");
      return false;
    } catch (err) {
      print("loginValidation error: ${err.toString()}");
      return false;
    }
  }

  Future<bool> addUser(Users users) async {
    final Database db = await database;
    try {
      db.insert(
        _DB_TABLE_USERS,
        users.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print(">>>>>>>>>>>>>> addUser success");
      return true;
    } catch (err) {
      print(">>>>>>>>>>>>>> addUser error: ${err.toString()}");
      return false;
    }
  }

  Future<bool> updateUser(Users user) async {
    final Database db = await database;
    try {
      db.update(
        _DB_TABLE_USERS, // table name
        user.toMap(),
        where: 'id = ?',
        // whereArgs: [user.id],
        whereArgs: ["3333"],
      );
      return true;
    } catch (e) {
      print("updateUser() e: ${e.toString()}");
      return false;
    }
  }

  Future<bool> deleteUser(id) async {
    final Database db = await database;
    try {
      db.delete(
        _DB_TABLE_USERS, // table name
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addPlace(Place place) async {
    final Database db = await database;
    try {
      db.insert(
        _DB_TABLE_PLACE, // table name
        {
          'id': place.id,
          "place_id": place.place_id,
          'name': place.name,
          "address": place.address,
        }, // new post row data
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deletePlace(id) async {
    final Database db = await database;
    try {
      db.delete(
        _DB_TABLE_PLACE, // table name
        where: 'place_id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Place> getPlanForUser(id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> data =
        await db.query(_DB_TABLE_PLACE, where: "id= ?", whereArgs: [id]);

    return Place(
        no: data[0]['no'],
        id: data[0]['id'],
        place_id: data[0]['place_id'],
        name: data[0]['name'],
        address: data[0]['address']);
  }

  Future<List<Place>> getAllPlaces() async {
    final Database db = await database;
    final List<Map<String, dynamic>> data = await db.query(_DB_TABLE_PLACE);

    return List.generate(data!.length, (i) {
      return Place(
          no: data[i]['no'],
          id: data[i]['id'],
          place_id: data[i]['place_id'],
          name: data[i]['name'],
          address: data[i]['address']);
    });
  }

  Future<bool> updatePlace(Place place) async {
    final Database db = await database;
    try {
      db.update(
        _DB_TABLE_PLACE, // table name
        place.toMap(),
        where: 'id = ?',
        whereArgs: [place.id],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removePlace(id) async {
    final Database db = await database;
    try {
      db.delete(
        _DB_TABLE_PLACE, // table name
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
