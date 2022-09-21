import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/controller/auth_controllers/user_controller.dart';
import 'package:store_app/data/repository/location_repo.dart';
import 'package:store_app/models/adress_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/utils/functions/handling_data.dart';

class LocationController extends GetxController implements GetxService{
  final LocationRepo locationRepo;
  final SharedPreferences sharedPref;
  LocationController({required this.sharedPref, required this.locationRepo});

  late TextEditingController addressController;
  late TextEditingController contactPersonNameController;
  late TextEditingController contactPersonNumberController;
  late bool isLoggedIn;

  CameraPosition cameraPosition = const CameraPosition(target: LatLng(
    45.51563, -122.677433
  ), zoom: 17);

  late LatLng initialPosition = const LatLng(
    45.51563, -122.677433
  );

  @override
  void onInit() {
    //print('====== INITIAL PAGE 1 ======');
    isLoggedIn = true; //Get.find<LoginController>().userLoggedIn();
    
    if(isLoggedIn /* && Get.find<UserController>().userModel == null */){
      Get.find<UserController>().getUserInfo();
    }

    addressController             = TextEditingController();
    contactPersonNameController   = TextEditingController();
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

  StatusRequest statusRequest = StatusRequest.none;

  /// for service zone
  /* final bool _loading = false;
  bool get loading => _loading; */
  /// whether the user is in service zone or not
  /* final bool _inZone = false;
  bool get inZone => _inZone; */
  /// showing and hiding the button as the map loads
  /* final bool _buttonDisabled = true;
  bool get buttonDisabled => _buttonDisabled; */

  late Position _position;
  late Position _pickPosition;
  Placemark _placemark = Placemark();
  Placemark get placemark => _placemark;
  Placemark _pickPlacemark = Placemark();
  Placemark get pickPlacemark => _pickPlacemark;

  List<AdressModel> _adressList = [];
  List<AdressModel> get adressList => _adressList;
  //late List<AdressModel> _allAdressList;
  //List<AdressModel> get allAdressList => _allAdressList;

  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;

  Position get position => _position;
  Position get pickPosition => _pickPosition;
  bool _updateAddressData = true;
  bool _changeAddress     = true;

  Map<String, dynamic> _getAddress={};
  Map<String, dynamic> get getAdress => _getAddress;

  // Start Address type
  final List<String> _adressTypeList = ['home','office','others'];
  List<String> get adressTypeList => _adressTypeList;
  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;
  
  void setAddressTypeIndex(int index){
    _addressTypeIndex = index;
    update();
  }
  // End  Address type

  void setMapController(GoogleMapController mapController){
    _mapController = mapController;
  }

  updatePosition(CameraPosition position, bool fromAddress) async {
    if(_updateAddressData){
      statusRequest = StatusRequest.loading;
      //_isLoading = true;
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
        /* ResponseModel responseModel = await getZone(
          position.target.latitude.toString(),
          position.target.longitude.toString(),
          false
        ); */
        /// If button value is false we are in the service area
        //_buttonDisabled = !responseModel.isSuccess;
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
      statusRequest = StatusRequest.success;
      //_isLoading = false;
      update();
    } else {
      _updateAddressData = true;
    }
  }

  Future<String> getAddresFromGeocode(LatLng latLng) async {
    String address = "";
    var response = await locationRepo.getAddresFromGeocode(latLng);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"] == 'OK'){
        address = response['results'][0]['formatted_address'].toString();
      }else{}
    }
    update();
    return address;
  }
  
  AdressModel getUserAddress(){
    late AdressModel addressModel;
    _getAddress = jsonDecode(locationRepo.getUserAddress());
    //print("GET ADDRESS FROM FUNC ========>" + _getAddress.toString());
    try {
      //print('INSIDE GET USER ADDRESS METHOD' + _getAddress.toString());
      addressModel = AdressModel.fromJson(_getAddress);
      //addressModel = AdressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
      //print('ADDRESS MODEL TOJSON METHOD${addressModel.toJson()}');
    } catch (e) {
      rethrow;
    }
    return addressModel;
  }

  addAddress(AdressModel addressModel) async {
    statusRequest = StatusRequest.loading;
    //_isLoading = true;
    update();
    var response = await locationRepo.addAddress(addressModel);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == 'success'){
        await getAddressList();
        //String msg = response.body["message"];
        await saveUserAddress(addressModel);
        Get.toNamed(AppRoute.getInitial());
        Get.snackbar('Address', 'Address added successfully');
      } else {
        Get.snackbar('Address', 'Couldn\'t save address!');
      }
    }else{
      Get.snackbar('Faild', 'Oops! Somthing went wrong!!!!',
        backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
    update();
  }

  Future<void> getAddressList() async {
    var response = await locationRepo.getAllAddress(sharedPref.getString('id')!);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == 'success'){
        _adressList = [];
        //_allAdressList = [];
        response['data'].forEach((address){
          _adressList.add(AdressModel.fromJson(address));
          //_allAdressList.add(AdressModel.fromJson(address));
        });
      } else {
        _adressList = [];
        //_allAdressList = [];
      }
    }else{
      Get.snackbar('Faild', 'Oops! Somthing went wrong',
        backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
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
    //_allAdressList = [];
    update();
  }

  setAddAddressData(){
    _position = _pickPosition;
    _placemark = _pickPlacemark;
    _updateAddressData = false;
    update();
  }

  /* getZone(String lat, String lng, bool markerLoad) async {
    //late ResponseModel responseModel;
    if(markerLoad){
      statusRequest = StatusRequest.loading;
      //_isLoading = true;
    } else {
      _loading = true;
    }
    update();
    var response = await locationRepo.getZone(lat, lng);
    if(response.statusCode == 200) {
      _inZone = true;
      //responseModel = ResponseModel(true, response.body["zone-id"].toString());
    } else {
      _inZone = false;
      //responseModel = ResponseModel(true, response.statusText!);
    }
    if(markerLoad){
      statusRequest = StatusRequest.success;
      //_isLoading = false;
    } else {
      _loading = false;
    }
    update();
    //return responseModel;
  } */

  /// save google map suggestions for address
  List<Prediction> _predictionList = [];

  Future<List<Prediction>> searchLocation(BuildContext context, String text) async {
    if(text.isNotEmpty){
      var response = await locationRepo.searchLocation(text);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response["status"] == 'OK'/*  && response.body["body"] == "OK" */){
          _predictionList = [];
          response['predictions'].forEach((prediction)
            => _predictionList.add(Prediction.fromJson(prediction)));
        } else {
          //ApiChecker.checkApi(response);
        }
      }else{
        Get.snackbar('Faild', 'Oops! Somthing went wrong!!!!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
      update();
    }
    return _predictionList;
  }

  setLocation(String placeId, String address, GoogleMapController mapController) async {
    statusRequest = StatusRequest.loading;
    //_isLoading = true;
    update();
    PlacesDetailsResponse details;
    var response = await locationRepo.setLocation(placeId);
    //statusRequest = handlingData(response);
    details = PlacesDetailsResponse.fromJson(response);
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
    statusRequest = StatusRequest.success;
    //_isLoading = false;
    update();
  }
}