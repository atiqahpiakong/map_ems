class Task {
  String userid;
  String id;
  String title;
  String due;
  String assign;
  String description;
  String status;

  Task(
      {this.userid,
      this.id,
      this.title,
      this.due,
      this.assign,
      this.description,
      this.status});
  Task.fromJson(Map<String, dynamic> json)
      : this(
            userid: json['userid'],
            id: json['id'],
            title: json['title'],
            due: json['due'],
            assign: json['assign'],
            description: json['description'],
            status: json['status']);

  Map<String, dynamic> toJson() => {
        'userid': userid,
        'title': title,
        'due': due,
        'assign': assign,
        'description': description,
        'status': status
      };
}
