import 'package:floor/floor.dart';
import 'package:guethub/data/model/term/term.dart';

@dao
abstract class TermDao {

  @Query("SELECT * FROM terms WHERE system_id = :systemId")
  Future<List<Term>> getAll(int systemId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(Term term);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<Term> terms);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> update(Term term);

}