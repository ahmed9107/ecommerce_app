import 'package:store_app/controller/location_controller.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/places.dart';

class LocationDialog extends StatelessWidget {
  final GoogleMapController mapController;
  const LocationDialog({
    Key? key,
    required this.mapController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Container(
      padding: EdgeInsets.all(Dimensions.width15),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius5),
        ),
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _controller,
              textInputAction:  TextInputAction.search,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                hintText: 'Search Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius5),
                  borderSide: const BorderSide(
                    style: BorderStyle.none, width:0
                  )
                )
              )
            ),
            itemBuilder: (BuildContext context, Prediction suggestion) {
              return Padding(
                padding: EdgeInsets.all(Dimensions.width10),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                    Expanded(
                      child: Text(
                        suggestion.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          fontSize: Dimensions.font18
                        )
                      )
                    ),
                  ],
                ),
              );
            },
            /// As we type it gives a suggestion
            onSuggestionSelected: (Prediction suggestion) {
              Get.find<LocationController>().setLocation(
                suggestion.placeId!, suggestion.description!, mapController);
              Get.back();
            },
            suggestionsCallback: (String pattern) async {
              print('PATTERN FROM SUGGCALLBACK !!! $pattern');
              return await Get.find<LocationController>().searchLocation(context, pattern);
            },
          )
        ),
      ),
    );
  }
}