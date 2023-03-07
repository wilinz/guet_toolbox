import 'package:floor/floor.dart';
import 'package:guettoolbox/data/model/term/term.dart';

@dao
abstract class TermDao {

  @Query("SELECT * FROM terms")
  Future<List<Term>> getAll();

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insert(Term term);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insertAll(List<Term> terms);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> update(Term term);

}