import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guethub/data/model/exam_scores_new/exam_scores_new.dart';

@dao
abstract class ExamScoresNewDao {
  @Query('SELECT * FROM exam_scores_new')
  Future<List<ExamScoresNew>> getAll();

  @Query(
      'SELECT * FROM exam_scores_new WHERE username = :username')
  Future<List<ExamScoresNew>> getAllByUsername(String username);

  @Query(
      'SELECT * FROM exam_scores_new WHERE id = :id and username = :username')
  Future<ExamScoresNew?> find(String id, String username);

  @Query('DELETE FROM exam_scores_new WHERE id NOT IN (:ids)')
  Future<ExamScoresNew?> deleteNotIn(List<String> ids);

  @Query('DELETE FROM exam_scores_new WHERE username = :username AND is_manually_add = :is_manually_add AND term = :term')
  Future<void> deleteByUsernameAndSourceAndTerm(String username, bool is_manually_add, String term);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrUpdateExamScoresNew(
      ExamScoresNew ExamScoresNew);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrUpdateExamScoresNews(
      List<ExamScoresNew> ExamScoresNews);

  @delete
  Future<void> deleteAll(
      List<ExamScoresNew> ExamScoresNews);
}
