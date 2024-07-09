import 'dart:async';
import 'package:agenda_crud/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      try {
        var path = join(await getDatabasesPath(), 'banco_contatos');
        // deleteDatabase(path); // Descomente se precisar resetar o banco de dados durante o desenvolvimento
        _db = await openDatabase(
          path,
          version: 1,
          onCreate: (db, version) async {
            await db.execute(createTable);
            await db.execute(insert1);
            await db.execute(insert2);
            await db.execute(insert3);
          },
        );
      } catch (e) {
        print("Erro ao abrir o banco de dados: $e");
        rethrow; // Propaga o erro para o chamador
      }
    }
    return _db!;
  }

  static Future close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}
