class People {
  int _id;
  String _firstName;
  String _lastName;
  String _mobile;
  int _gender;

  final String columnId = 'id';
  final String columnFirstName = 'first_name';
  final String columnLastName = 'last_name';
  final String columnMobile = 'mobile';
  final String columnGender = 'gender';

  People(this._id, this._firstName, this._lastName, this._mobile, this._gender);

  int get id => _id;

  String get firstName => _firstName;

  int get gender => _gender;

  String get mobile => _mobile;

  String get lastName => _lastName;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map[columnId] = _id;
    }
    map[columnFirstName] = _firstName;
    map[columnLastName] = _lastName;
    map[columnMobile] = _mobile;
    map[columnGender] = _gender;
    return map;
  }

  // Extract a Note object from a Map object
  People.fromMapObject(Map<String, dynamic> map) {
    this._id = map[columnId];
    this._firstName = map[columnFirstName];
    this._lastName = map[columnLastName];
    this._mobile = map[columnMobile];
    this._gender = map[columnGender];
  }

  set id(int value) {
    _id = value;
  }


  set firstName(String value) {
    _firstName = value;
  }

  set gender(int value) {
    _gender = value;
  }

  set mobile(String value) {
    _mobile = value;
  }

  set lastName(String value) {
    _lastName = value;
  }
}
