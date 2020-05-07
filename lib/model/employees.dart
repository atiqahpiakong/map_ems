class Employees {
  String employee_id;
  String fullName;
  String jobType;

  Employees(this.employee_id, this.fullName, this.jobType);
  Employees.copy(Employees from) : this(from.employee_id, from.fullName, from.jobType);
}
