// ignore_for_file: prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:quiz_app/core/errors/failures.dart';
import 'package:quiz_app/core/utils/utility_objects.dart';
import 'package:quiz_app/features/questions/data/models/question_model.dart';
import 'package:quiz_app/features/questions/domain/entities/question.dart';
import 'package:sqflite/sqflite.dart';

class QuestionLocalDatasource {
  Future<Database> _openDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'questions_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE questions('
          'id INTEGER PRIMARY KEY, '
          'description TEXT, '
          'explanation TEXT, '
          'answer INTEGER, '
          'options TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<Either<Failure, Success>> putQuestions(
      List<Question> questions) async {
    try {
      final db = await _openDatabase();

      for (var question in questions) {
        final questionModel = QuestionModel(
          id: question.id,
          answer: question.answer,
          description: question.description,
          explanation: question.explanation,
          options: question.options,
        );

        await db.insert(
          'questions',
          questionModel.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      return Right(OperationSuccess('Questions inserted successfully'));
    } catch (e) {
      return Left(DataBaseFailure('Failed to insert questions: $e'));
    }
  }

  Future<Either<Failure, List<Question>>> getQuestions() async {
    try {
      final db = await _openDatabase();
      final List<Map<String, dynamic>> maps = await db.query('questions');

      final questions = List<QuestionModel>.from(
        maps.map((map) => QuestionModel.fromJson(map)),
      );

      return Right(questions);
    } catch (e) {
      return Left(DataBaseFailure('Failed to fetch questions: $e'));
    }
  }
}
