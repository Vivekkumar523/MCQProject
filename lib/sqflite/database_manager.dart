import 'package:sqflite/sqflite.dart';

import '../models/questions_model.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'questions.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE questions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            question TEXT,
            options TEXT,
            correctAnswerIndex INTEGER,
            selectedAnswerIndex INTEGER
          )
        ''');
      },
      version: 1,
    );
  }

// -------
  static Future<void> insertQuestion(QuestionModel question) async {
    final db = await initDb();
    await db.insert('questions', question.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<QuestionModel>> getQuestions() async {
    final db = await initDb();
    final List<Map<String, dynamic>> maps = await db.query('questions');
    return maps.map((e) => QuestionModel.fromMap(e)).toList();
  }
}
