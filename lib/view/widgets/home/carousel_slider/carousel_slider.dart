import 'package:get/get.dart';
import 'package:store_app/controller/products_controller.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/dot_indicator.dart';
import 'package:store_app/view/widgets/home/carousel_slider/carousel_slider_item.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({Key? key}) : super(key: key);

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  PageController pageController = PageController(viewportFraction: 0.9);
  double _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.height210 + 10;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<ProductsController>(builder: (controller) {
          return 
          SizedBox(
            height: Dimensions.pageViewContainer,
            child: PageView.builder(
              controller: pageController,
              itemCount: controller.discountProductList.length,
              itemBuilder: (context, index) {
                Matrix4 matrix = Matrix4.identity();

                if (index == _currentPageValue.floor()) {
                  var currentScale =
                      1 - (_currentPageValue - index) * (1 - _scaleFactor);
                  var currTrans = _height * (1 - currentScale) / 2;
                  matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                    ..setTranslationRaw(0, currTrans, 0);
                } else if (index == _currentPageValue.floor() + 1) {
                  var currentScale = _scaleFactor +
                      (_currentPageValue - index + 1) * (1 - _scaleFactor);
                  var currTrans = _height * (1 - currentScale) / 2;
                  matrix = Matrix4.diagonal3Values(1, currentScale, 1);
                  matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                    ..setTranslationRaw(0, currTrans, 0);
                } else if (index == _currentPageValue.floor() - 1) {
                  var currentScale =
                      1 - (_currentPageValue - index) * (1 - _scaleFactor);
                  var currTrans = _height * (1 - currentScale) / 2;
                  matrix = Matrix4.diagonal3Values(1, currentScale, 1);
                  matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                    ..setTranslationRaw(0, currTrans, 0);
                } else {
                  var currentScale = 0.8;
                  matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                    ..setTranslationRaw(0, _height * (1 - _scaleFactor), 0);
                }
                return Transform(
                  transform: matrix,
                  child: CarouselItem(
                    position: index,
                    product: controller.discountProductList[index],
                    page: 'initial'));
              }),
          );
        }),
        SizedBox(height: Dimensions.height10),
        GetBuilder<ProductsController>(builder: (controller) {
          return DotsIndicator(
            currentPage: _currentPageValue,
            dotsNumber: controller.discountProductList.length <= 1
              ? 1
              : controller.discountProductList.length
          );
        })
      ],
    );
  }
}
