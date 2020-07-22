class Leave {
  String id;
  String userid;
  String leavefrom;
  String leaveto;
  String reason;
  String type;
  String status;
  String name;

  Leave(
      {this.userid,
      this.id,
      this.leavefrom,
      this.leaveto,
      this.reason,
      this.type,
      this.status,
      this.name});
  Leave.fromJson(Map<String, dynamic> json)
      : this(
            userid: json['userid'],
            id: json['id'],
            leavefrom: json['leavefrom'],
            leaveto: json['leaveto'],
            reason: json['reason'],
            status: json['status'],
            type: json['type'],
            name: json['name']);

  Map<String, dynamic> toJson() => {
        'userid': userid,
        'leavefrom': leavefrom,
        'leaveto': leaveto,
        'reason': reason,
        'type': type,
        'status': status,
        'name': name
      };
}
