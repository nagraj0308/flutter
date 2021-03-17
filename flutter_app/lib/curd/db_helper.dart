import 'package:flutter_app/curd/people.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final String tableName= 'contact';
final String columnId = 'id';
final String columnFirstName = 'first_name';
final String columnLastName = 'last_name';
final String columnMobile = 'mobile';
final String columnGender = 'gender';

class ContactHelper {
  static Database _database;
  static ContactHelper _alarmHelper;

  ContactHelper._createInstance();
  factory ContactHelper() {
    if (_alarmHelper == null) {
      _alarmHelper = ContactHelper._createInstance();
    }
    return _alarmHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "contact.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableName ( 
          $columnId integer , 
          $columnFirstName text not null,
          $columnLastName text not null,
          $columnMobile text not null,
          $columnGender bool)
        ''');
      },
    );
    return database;
  }

  Future<List<People>> getPeople() async {
    Database db= await this.database;
    var result= await db.query(tableName);
    List<People> _contacts = [];
    result.forEach((element) {
      var contact = People.fromMap(element);
      _contacts.add(contact);
    });
    return _contacts;
  }

  void insertContact(People people) async {
    var db = await this.database;
    var result = await db.insert(tableName, people.toMap());
    print('result : $result');
  }




  Future<int> delete(int id) async {
    var db = await this.database;
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}