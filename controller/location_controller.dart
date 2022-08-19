import 'dart:convert';
import 'package:store_app/controller/auth_controllers/login_controller.dart';
import 'package:store_app/controller/auth_controllers/user_controller.dart';
import 'package:store_app/data/api/api_checker.dart';
import 'package:store_app/data/repository/location_repo.dart';
import 'package:store_app/models/adress_model.dart';
import 'package:store_app/models/response.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/places.dart';

class LocationController extends GetxController implements GetxService{
  final LocationRepo locationRepo;
  LocationController({required this.locationRepo});

  late TextEditingController addressController;
  late TextEditingController contactPersonNameController;
  late TextEditingController contactPersonNumberController;
  late bool isLoggedIn;

  CameraPosition cameraPosition= const CameraPosition(target: LatLng(
    45.51563, -122.677433
  ), zoom: 17);

  late LatLng initialPosition = const LatLng(
    45.51563, -122.677433
  );

  @override
  void onInit() {
    //print('====== INITIAL PAGE 1 ======');
    isLoggedIn = true; //Get.find<LoginController>().userLoggedIn();
    
    if(isLoggedIn && Get.find<UserController>().userModel == null){
      Get.find<UserController>().getUserInfo();
    }

    addressController = TextEditingController();
    contactPersonNameController = TextEditingController();
    contactPersonNumberController = TextEditingController();

    if(_adressList.isNotEmpty){
      if(getUserAddressFromLocalStorage() == ''){
        saveUserAddress(_adressList.last);
      }
      getUserAddress();
      //print("GET ADDRESS ========>" + _getAddress.toString());
      cameraPosition = CameraPosition(target: LatLng(
        double.parse(_getAddress['latitude']),
        double.parse(_getAddress['longitude'])
      ));
      initialPosition = LatLng(
        double.parse(_getAddress['latitude']),
        double.parse(_getAddress['longitude'])
      );
    }
    //print('====== INITIAL PAGE 2 ======');
    super.onInit();
  }

  @override
  void dispose() {
    addressController.dispose();
    contactPersonNameController.dispose();
    contactPersonNumberController.dispose();
    super.dispose();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// for service zone
  bool _loading = false;
  bool get loading => _loading;
  /// whether the user is in service zone or not
  bool _inZone = false;
  bool get inZone => _inZone;
  /// showing and hiding the button as the map loads
  bool _buttonDisabled = true;
  bool get buttonDisabled => _buttonDisabled;

  late Position _position;
  late Position _pickPosition;
  Placemark _placemark = Placemark();
  Placemark get placemark => _placemark;
  Placemark _pickPlacemark = Placemark();
  Placemark get pickPlacemark => _pickPlacemark;

  List<AdressModel> _adressList = [];
  List<AdressModel> get adressList => _adressList;
  late List<AdressModel> _allAdressList;
  List<AdressModel> get allAdressList => _allAdressList;
  final List<String> _adressTypeList = ['home','office','others'];
  List<String> get adressTypeList => _adressTypeList;
  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;

  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;

  Position get position => _position;
  Position get pickPosition => _pickPosition;

  void setMapController(GoogleMapController mapController){
    _mapController = mapController;
  }

  bool _updateAddressData = true;
  bool _changeAddress = true;

  updatePosition(CameraPosition position, bool fromAddress) async {
    if(_updateAddressData){
      _isLoading = true;
      update();
      try {
        if(fromAddress){
          _position = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1
          );
        } else {
          _pickPosition = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1
          );
        }
        ResponseModel responseModel = await getZone(
          position.target.latitude.toString(),
          position.target.longitude.toString(),
          false
        );
        /// If button value is false we are in the service area
        _buttonDisabled = !responseModel.isSuccess;
        if(_changeAddress){
          String address = await getAddresFromGeocode(
            LatLng(
              position.target.latitude,
              position.target.longitude,
            )
          );
          fromAddress 
              ? _placemark = Placemark(name: address)
              :_pickPlacemark = Placemark(name: address);
        }else{
          _changeAddress =true;
        }
      } catch (e) {
        //print('INSIDE UPDATE USER METHOD' + e.toString());
        rethrow;
      }
      _isLoading = false;
      update();
    } else {
      _updateAddressData = true;
    }
  }

  Future<String> getAddresFromGeocode(LatLng latLng) async {
    String address = "";
    Response response = await locationRepo.getAddresFromGeocode(latLng);
    if(response.body["status"] == 'OK'){
      address = response.body['results'][0]['formatted_address'].toString();
    }else{

    }
    update();
    return address;
  }

  Map<String, dynamic> _getAddress={};
  Map<String, dynamic> get getAdress => _getAddress;
  
  AdressModel getUserAddress(){
    late AdressModel addressModel;
    _getAddress = jsonDecode(locationRepo.getUserAddress());
    //print("GET ADDRESS FROM FUNC ========>" + _getAddress.toString());
    try {
      //print('INSIDE GET USER ADDRESS METHOD' + _getAddress.toString());
      addressModel = AdressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
      print('ADDRESS MODEL TOJSON METHOD' + addressModel.toJson().toString());
    } catch (e) {
      rethrow;
    }
    return addressModel;
  }

  void setAddressTypeIndex(int index){
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel> addAddress(AdressModel addressModel) async {
    _isLoading = true;
    update();
    Response response = await locationRepo.addAddress(addressModel);
    ResponseModel responseModel;
    if(response.statusCode == 200){
      await getAddressList();
      String msg = response.body["message"];
      responseModel= ResponseModel(true, msg);
      await saveUserAddress(addressModel);
    } else {
      responseModel= ResponseModel(true, response.statusText!);
    }
    update();
    return responseModel;
  }

  Future<void> getAddressList() async {
    Response response = await locationRepo.getAllAddress();
    if(response.statusCode == 200){
      _adressList = [];
      _allAdressList = [];
      response.body.forEach((address){
        _adressList.add(AdressModel.fromJson(address));
        _allAdressList.add(AdressModel.fromJson(address));
      });
    } else {
      _adressList = [];
      _allAdressList = [];
    }
    update();
  }

  Future<bool> saveUserAddress(AdressModel addressModel) async {
    String userAddress = jsonEncode(addressModel.toJson());
    return await locationRepo.saveUserAddress(userAddress);
  }

  String getUserAddressFromLocalStorage(){
    return locationRepo.getUserAddress();
  }

  void clearAddressList(){
    _adressList = [];
    _allAdressList = [];
    update();
  }

  setAddAddressData(){
    _position = _pickPosition;
    _placemark = _pickPlacemark;
    _updateAddressData = false;
    update();
  }

  Future<ResponseModel> getZone(String lat, String lng, bool markerLoad) async {
    late ResponseModel responseModel;
    if(markerLoad){
      _isLoading = true;
    } else {
      _loading = true;
    }
    update();
    Response response = await locationRepo.getZone(lat, lng);
    if(response.statusCode == 200) {
      _inZone = true;
      responseModel = ResponseModel(true, response.body["zone-id"].toString());
    } else {
      _inZone = false;
      responseModel = ResponseModel(true, response.statusText!);
    }
    if(markerLoad){
      _isLoading = false;
    } else {
      _loading = false;
    }
    update();
    return responseModel;
  }

  /// save google map suggestions for address
  List<Prediction> _predictionList = [];

  Future<List<Prediction>> searchLocation(BuildContext context, String text) async {
    if(text.isNotEmpty){
      Response response = await locationRepo.searchLocation(text);
      if(response.statusCode == 200 && response.body["body"] == "OK"){
        _predictionList = [];
        response.body['prediction'].forEach((prediction)
          => _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }

  setLocation(String placeId, String address, GoogleMapController mapController) async {
    _isLoading = true;
    update();
    PlacesDetailsResponse details;
    Response response = await locationRepo.setLocation(placeId);
    details = PlacesDetailsResponse.fromJson(response.body);
    _pickPosition = Position(
      longitude: details.result.geometry!.location.lng,
      latitude: details.result.geometry!.location.lat,
      timestamp: DateTime.now(),
      accuracy: 1,
      altitude: 1,
      heading: 1,
      speed: 1,
      speedAccuracy: 1
    );
    _pickPlacemark = Placemark(name: address);
    _changeAddress = false;
    if(!mapController.isNull){
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(
          details.result.geometry!.location.lng,
          details.result.geometry!.location.lat,
        ), zoom: 17)
      ));
    }
    _isLoading = false;
    update();
  }
}