import 'package:floor/floor.dart';
import 'package:guethub/data/model/semesters/semesters.dart';
import 'package:guethub/data/model/term/term.dart';

@dao
abstract class SemesterDao {

  @Query("SELECT * FROM semesters")
  Future<List<Semester>> getAll();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(Semester term);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<Semester> terms);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> update(Semester term);

}