class Criterion {
  String title;
  String description;

  Criterion(this.title, this.description);
}

class Scale {
  int value;
  String title;

  Scale(this.value, this.title);
}

List<Criterion> criteria = [

  Criterion('Communication', 'Good communication among the employees and can deliver well'),
  Criterion('Interaction', 'Degree of interaction with other employees'),
  Criterion('Adaptability', 'Can work independently or work well with a team'),
  Criterion('Commitment', 'The level of enthusiasm an employee has towards his/her tasks assigned at a workplace'),
  Criterion('Effort','The amount of effort and work contributed to the company outcome'),
  Criterion('Personality', 'Degree of compromisation between employees'),
  Criterion('Leadership', 'Able to make a wise decision for the task give'),


];

List<Scale> scales = [
  Scale(4, 'Outstanding'),
  Scale(3, 'Excellent'),
  Scale(2, 'Very Good'),
  Scale(1, 'Satisfactory'),
  Scale(0, 'Below Average')
];
