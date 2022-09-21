import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/notify_container.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: const BigText(text: 'Notification'),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimensions.height15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BigText(text: 'Today', fontWeight: FontWeight.bold),
              const NotifyContainer(
                title: '30% Special Discount',
                subTitle: 'Special promotion valid for today',
              ),
              SizedBox(height: Dimensions.height10),
              const BigText(text: 'Decembre 22, 2022', fontWeight: FontWeight.bold),
              const NotifyContainer(
                title: 'New service available',
                subTitle: 'Now you can track orders in real time',
              ),
              const NotifyContainer(
                title: 'New service available',
                subTitle: 'Now you can track orders in real time',
              ),
              const NotifyContainer(
                title: 'New service available',
                subTitle: 'Now you can track orders in real time',
              ),
            ],
          ),
        ),
      ),
    );
  }
}