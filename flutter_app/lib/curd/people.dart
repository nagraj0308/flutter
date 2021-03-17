class People {
  int id;
  String firstName;
  String lastName;
  String mobile;
  String gender;


  final String columnId = 'id';
  final String columnFirstName = 'first_name';
  final String columnLastName = 'last_name';
  final String columnMobile = 'mobile';
  final String columnGender = 'gender';


  People({this.id, this.firstName, this.lastName, this.mobile, this.gender});

  factory People.fromMap(Map<String, dynamic> json) => People(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    mobile: json["mobile"],
    gender: json["gender"],
  );

  Map<String, dynamic> toMap() => {
    columnId: id,
    columnFirstName: firstName,
    columnLastName: lastName,
    columnMobile: mobile,
    columnGender: gender,
  };
}
