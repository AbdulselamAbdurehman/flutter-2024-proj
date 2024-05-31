// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/data/models/question_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class QuestionLocalDatasource {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'questions_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE questions(id INTEGER PRIMARY KEY, description TEXT, explanation TEXT, answer INTEGER, options TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<Either<Failure, Success>> putQuestions(
      List<QuestionModel> questions) async {
    try {
      final db = await _getDatabase();
      Batch batch = db.batch();

      for (var question in questions) {
        final questionMap = question.toJson();
        questionMap['options'] =
            jsonEncode(question.options); // Convert options to JSON string
        batch.insert(
          'questions',
          questionMap,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(noResult: true);
      return Right(OperationSuccess('Questions saved successfully.'));
    } catch (e) {
      return Left(DataBaseFailure('Database couldn\'t save questions: $e'));
    }
  }

  Future<Either<Failure, List<QuestionModel>>> getQuestions() async {
    try {
      final db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query('questions');

      if (maps.isEmpty) {
        return Left(DataBaseFailure('No questions found.'));
      }

      List<QuestionModel> questions = List.generate(maps.length, (i) {
        final questionMap = maps[i];
        questionMap['options'] = jsonDecode(
            questionMap['options']); // Convert JSON string back to list
        return QuestionModel.fromJson(questionMap);
      });

      return Right(questions);
    } catch (e) {
      return Left(DataBaseFailure('Database couldn\'t get questions: $e'));
    }
  }

  Future<Either<Failure, Success>> deleteQuestion(
      QuestionModel question) async {
    try {
      final db = await _getDatabase();
      await db.delete(
        'questions',
        where: 'id = ?', // Ensure the correct column is targeted
        whereArgs: [question.questionNumber],
      );

      return Right(OperationSuccess('Question deleted successfully.'));
    } catch (e) {
      return Left(DataBaseFailure('Database couldn\'t delete question: $e'));
    }
  }
}
