import 'package:flutter_test/flutter_test.dart';
import 'package:guethub/data/model/course/semester_schedule.dart';
import 'package:guethub/data/model/course/tools.dart';

void main() {
  group('mergeWeeks', () {
    test('should return merged week ranges correctly', () {
      List<int> weekIndexes = [16, 5, 7, 8, 10, 11, 12, 13, 14];
      List<WeekRange> expected = [
        WeekRange(5, 5),
        WeekRange(7, 8),
        WeekRange(10, 14),
        WeekRange(16, 16),
      ];

      List<WeekRange> result = mergeWeeks(weekIndexes);

      expect(result.length, expected.length);
      for (int i = 0; i < result.length; i++) {
        expect(result[i].weekStart, expected[i].weekStart);
        expect(result[i].weekEnd, expected[i].weekEnd);
      }
    });

    test('should handle empty input', () {
      List<int> weekIndexes = [];
      List<WeekRange> result = mergeWeeks(weekIndexes);

      expect(result, isEmpty);
    });

    test('should handle single week input', () {
      List<int> weekIndexes = [9];
      List<WeekRange> expected = [WeekRange(9, 9)];

      List<WeekRange> result = mergeWeeks(weekIndexes);

      expect(result.length, 1);
      expect(result[0].weekStart, expected[0].weekStart);
      expect(result[0].weekEnd, expected[0].weekEnd);
    });

    test('should handle already sorted continuous weeks', () {
      List<int> weekIndexes = [1, 2, 3, 4, 5];
      List<WeekRange> expected = [WeekRange(1, 5)];

      List<WeekRange> result = mergeWeeks(weekIndexes);

      expect(result.length, 1);
      expect(result[0].weekStart, expected[0].weekStart);
      expect(result[0].weekEnd, expected[0].weekEnd);
    });

    test('should handle weeks with gaps', () {
      List<int> weekIndexes = [2, 5, 6, 10];
      List<WeekRange> expected = [
        WeekRange(2, 2),
        WeekRange(5, 6),
        WeekRange(10, 10),
      ];

      List<WeekRange> result = mergeWeeks(weekIndexes);

      expect(result.length, expected.length);
      for (int i = 0; i < result.length; i++) {
        expect(result[i].weekStart, expected[i].weekStart);
        expect(result[i].weekEnd, expected[i].weekEnd);
      }
    });
  });
}
