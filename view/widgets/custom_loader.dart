import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.halfTriangleDot(
        color: Theme.of(context).primaryColorLight,
        size: 150,
      ),
      /* Container(
        height: Dimensions.height20*5,
        width: Dimensions.height20*5,
        /* decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20*5/2),
          color: Theme.of(context).primaryColor
        ), */
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Colors.white),
      ), */
    );
  }
}