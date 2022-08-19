class AdressModel{
  int? _id;
  late String _adressType;
  String? _contactPersonName;
  String? _contactPersonNumber;
  String? _adress;
  String? _latitude;
  String? _longitude;

  AdressModel({
    id,
    required adressType,
    contactPersonName,
    contactPersonNumber,
    adress,
    latitude,
    longitude,
  }){
    _id = id;
    _adressType = adressType;
    _contactPersonName = contactPersonName;
    _contactPersonNumber = contactPersonNumber;
    _adress = adress;
    _latitude = latitude;
    _longitude = longitude;
  }

  String? get adress => _adress;
  String get adressType => _adressType;
  String? get contactPersonName => _contactPersonName;
  String? get contactPersonNumber => _contactPersonNumber;
  String? get latitude => _latitude;
  String? get longitude => _longitude;

  AdressModel.fromJson(Map<String, dynamic> json){
    _id = json['user_id'];
    _adressType = json['address_type']??'';
    _contactPersonName = json['contact_person_name']??'';
    _contactPersonNumber = json['contact_person_number']??'';
    _adress = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': _id,
      'address_type': _adressType,
      'contact_person_name': _contactPersonName,
      'contact_person_number': _contactPersonNumber,
      'address': _adress,
      'latitude': _latitude,
      'longitude': _longitude,
    };
  }
}