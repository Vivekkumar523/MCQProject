import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/questions_model.dart';
// import '../models/quiz_question_model.dart';

class DatabaseHelper {
  // static final DatabaseHelper instance = DatabaseHelper._init();
  // static Database? _database;
  //
  // DatabaseHelper._init();
  //
  // Future<Database> get database async {
  //   if (_database != null) return _database!;
  //   _database = await _initDB('quiz.db');
  //   return _database!;
  // }
  //
  // // Open the database and create the table if it doesn't exist
  // Future<Database> _initDB(String filePath) async {
  //   final dbPath = await getDatabasesPath();
  //   final path = join(dbPath, filePath);
  //
  //   return await openDatabase(path, version: 1, onCreate: _onCreate);
  // }
  //
  // // Create the questions table
  // Future _onCreate(Database db, int version) async {
  //   await db.execute('''
  //     CREATE TABLE questions (
  //       id INTEGER PRIMARY KEY AUTOINCREMENT,
  //       questions TEXT,
  //       options TEXT,
  //       correctAnswerIndex INTEGER
  //     )
  //   ''');
  // }
  // Future<int> insertQuestion(QuizQuestionModel question) async {
  //   final db = await instance.database;
  //   return await db.insert('questions', question.toMap());
  // }
  //
  // // Retrieve all questions from the database
  // Future<List<QuizQuestionModel>> getQuestions() async {
  //   final db = await instance.database;
  //   final result = await db.query('questions');
  //   return result.map((map) => QuizQuestionModel.fromMap(map)).toList();
  // }

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

  static Future<void> insertQuestion(QuestionModel question) async {
    final db = await initDb();
    await db.insert('questions', question.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<QuestionModel>> getQuestions() async {
    final db = await initDb();
    final List<Map<String, dynamic>> maps = await db.query('questions');
    return maps.map((e) => QuestionModel.fromMap(e)).toList();
  }
}