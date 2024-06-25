import 'dart:async';
import 'package:agenda_crud/app/Database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  late Database _db;

  Future<Database> initDb() async {
    // ignore: unnecessary_null_comparison
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_contatos');
      _db = await openDatabase(
        path,
        version: 1, 
        onCreate: (db, v){
          db.execute(createTable);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        }, 
        );
      
    }
    return _db;
  }

  static get() {}
}