class AdressModel{
  String? _id;
  late String _adressType;
  String? _adress;
  String? _latitude;
  String? _longitude;

  AdressModel({
    id,
    required adressType,
    adress,
    latitude,
    longitude,
  }){
    _id = id;
    _adressType = adressType;
    _adress = adress;
    _latitude = latitude;
    _longitude = longitude;
  }

  String? get adress => _adress;
  String get adressType => _adressType;
  String? get latitude => _latitude;
  String? get longitude => _longitude;

  AdressModel.fromJson(Map<String, dynamic> json){
    _id                   = json['user_id'];
    _adressType           = json['address_type']??'';
    _adress               = json['address'];
    _latitude             = json['latitude'];
    _longitude            = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id'           : _id,
      'address_type'      : _adressType,
      'address'           : _adress,
      'latitude'          : _latitude,
      'longitude'         : _longitude,
    };
  }
}