import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/utils/constants/image_asset.dart';
import 'package:store_app/utils/constants/status-request.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/custom_loader.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget child;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: CustomLoader())
        : statusRequest == StatusRequest.offlineFailure
            ? Center(child: Column(
              children: [
                Lottie.asset(ImageAsset.offline , width: 250 , height: 250),
                const SizedBox(height: 10.0),
                const BigText(text: 'Check your connection!')
              ],
            ))
            : statusRequest == StatusRequest.serverFailure
                ? Center(child: Lottie.asset(ImageAsset.server , width: 250 , height: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(child: Lottie.asset(ImageAsset.noData , width: 250 , height: 250 , repeat: true  ))
                    : child;
  }
}