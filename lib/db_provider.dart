import 'dart:io';
import 'package:first_task_project/models/article_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();


  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database!;

    // If database don't exists, create one
    _database = await initDB();

    return _database!;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'news_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE News('
              'title TEXT PRIMARY KEY,'
              'description TEXT,'
              'author TEXT,'
              'content TEXT,'
              'url TEXT,'
              'urlToImage TEXT'
              ')');
        });
  }

  // Insert news in database
  createNews(ArticleModel newArticleModel) async {
    await deleteAllNews();
    final db = await database;
    final res = await db.insert('News', newArticleModel.toJson());
    return res;
  }

  // Delete all employees
  Future<int> deleteAllNews() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM News');

    return res;
  }

  Future<List<ArticleModel>> getAllNews() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM News");

    List<ArticleModel> list =
    res.isNotEmpty ? res.map((c) => ArticleModel.fromJson(c)).toList(): [];

    return list;
  }
}