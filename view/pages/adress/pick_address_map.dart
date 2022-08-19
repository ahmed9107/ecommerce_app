import 'package:store_app/controller/location_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/utils/constants/colors.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/address_widgets/search_location.dart';
import 'package:store_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController googleMapController;
  
  const PickAddressMap({
    Key? key,
    required this.fromSignup,
    required this.fromAddress,
    required this.googleMapController
  }) : super(key: key);

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initialPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    super.initState();
    if(Get.find<LocationController>().adressList.isEmpty){
      _initialPosition = const LatLng(45.521563, -122.677433);
      _cameraPosition = CameraPosition(
        target: _initialPosition, zoom: 17
      );
    } else {
      //Get.find<LocationController>().getUserAddress();
      if(Get.find<LocationController>().adressList.isNotEmpty){
        _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAdress['latitude']),
          double.parse(Get.find<LocationController>().getAdress['longitude'])
        );
        _cameraPosition = CameraPosition(
          target: _initialPosition, zoom: 17
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (locationController) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SizedBox(
                width:double.maxFinite,
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition, zoom: 17
                      ),
                      zoomControlsEnabled: false,
                      onCameraMove: (CameraPosition cameraPosition){
                        _cameraPosition = cameraPosition;
                      },
                      onCameraIdle: (){
                        Get.find<LocationController>().updatePosition(
                          _cameraPosition, false
                        );
                      },
                      onMapCreated: (GoogleMapController mapController){
                        _mapController = mapController;
                      }
                    ),
                    Center(
                      child: !locationController.isLoading 
                          ? Image.asset('assets/images/pin.png', height: 50, width: 50)
                          :const CircularProgressIndicator()
                    ),
                    Positioned(
                      top: Dimensions.height45,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      child: InkWell(
                        onTap: () => Get.dialog(LocationDialog(
                          mapController: _mapController,
                        )),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                          height: Dimensions.height50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(Dimensions.radius10),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on, size: 25, color: Colors.black),
                              Expanded(child: Text(
                                  locationController.pickPlacemark.name ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                              const Icon(Icons.search, size: 25, color: Colors.black),
                            ]
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Dimensions.height45*2,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      child: locationController.loading 
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                          text: locationController.inZone 
                            ? widget.fromAddress ? "Pick Address" : "Pick Location"
                            : 'Service isn\'t availble in your area!',
                          onPressed: locationController.buttonDisabled || locationController.isLoading 
                            ? null
                            : () {
                              if(locationController.pickPosition.latitude !=0 &&
                                locationController.pickPlacemark.name != null){
                                if(widget.fromAddress){
                                  widget.googleMapController.moveCamera(
                                    CameraUpdate.newCameraPosition(
                                      CameraPosition(target: LatLng(
                                        locationController.pickPosition.latitude,
                                        locationController.pickPosition.longitude
                                      ))));
                                  locationController.setAddAddressData();
                                }
                                Get.toNamed(AppRoute.getAddressPage());
                              }
                            },
                      ),
                    )
                  ]
                ),
              ),
            )
          ),
        );
      }
    );
  }
}