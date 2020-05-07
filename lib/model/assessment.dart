import 'employees.dart';

class Assessment {
  Employees member;
  List<int> points;

  Assessment(this.member, this.points);
  Assessment.copy(Assessment from)
      : this(Employees.copy(from.member), [...from.points]);

  double get percent =>
      (points.reduce((sum, item) => sum + item) / 20.0) * 100.0;
}
