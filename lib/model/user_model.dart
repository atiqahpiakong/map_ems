class User {
  String id;
  String address;
  String department;
  String email;
  String name;
  String phone;

User({this.id, this.address, this.department, this.email, this.name, this.phone});
User.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            address: json['address'],
            department: json['department'],
            email: json['email'],
            name: json['name'],
            phone: json['phone']);

  Map<String, dynamic> toJson() =>
      {'address': address, 'department': department, 'email': email, 'name': name, 'phone': phone};

}