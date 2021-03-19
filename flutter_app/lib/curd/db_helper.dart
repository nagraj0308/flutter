import 'package:flutter_app/curd/people.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  final String tableContacts = 'contacts';
  final String columnId = 'id';
  final String columnFirstName = 'first_name';
  final String columnLastName = 'last_name';
  final String columnMobile = 'mobile';
  final String columnGender = 'gender';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableContacts($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnFirstName TEXT, '
        '$columnLastName TEXT, $columnMobile TEXT, $columnGender INTEGER)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getContactMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(tableContacts, orderBy: '$columnId ASC');
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertContact(People people) async {
    Database db = await this.database;
    var result = await db.insert(tableContacts, people.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateContact(People people) async {
    var db = await this.database;
    var result = await db.update(tableContacts, people.toMap(),
        where: '$columnId = ?', whereArgs: [people.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteContact(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $tableContacts WHERE $columnId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $tableContacts');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<People>> getContactList() async {
    var contactMapList =
        await getContactMapList(); // Get 'Map List' from database
    int count =
        contactMapList.length; // Count the number of map entries in db table

    List<People> contactList = <People>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      contactList.add(People.fromMapObject(contactMapList[i]));
    }

    return contactList;
  }
}
