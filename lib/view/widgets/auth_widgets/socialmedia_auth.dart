import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/small_text.dart';
import 'package:flutter/material.dart';

class SocialMediaAuth extends StatelessWidget {
  SocialMediaAuth({Key? key}) : super(key: key);

  List<String> signUpImg = [
      'gg.png',
      'fb.png',
      'tt.png',
    ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 1.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              const SmallText(text: 'Or'),
              SizedBox(width: Dimensions.width10),
              Expanded(
                child: Container(
                  height: 1.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height15),
        Wrap(
          children: List.generate(3, (index) 
          => Container(
            width: Dimensions.width6*10,
            height: Dimensions.width6*10,
            padding: const EdgeInsets.all(10.0),
            margin: EdgeInsets.only(right: Dimensions.height15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius5),
              color:Theme.of(context).backgroundColor,
            ),
            child: Image.asset('assets/images/${signUpImg[index]}'),
          )),
        )
      ],
    );
  }
}