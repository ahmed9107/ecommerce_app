import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/helpers/dimensions.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:store_app/view/widgets/chat_container.dart';
import 'package:store_app/view/widgets/custom_input_field.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController msgController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: const BigText(text: 'Customer Services'),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).primaryColorLight)),
        actions: const []
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.height15),
        child: Column(
          children: [
            const ChatContainer(
              text: 'Hello Good morning',
              isCustomer: false,
            ),
            const ChatContainer(
              text: 'I am a customer service is there anything I can help you with?',
              isCustomer: false,
            ),
            const ChatContainer(
              text: 'Hi I having problems with my orders',
              isCustomer: true,
            ),
            const ChatContainer(
              text: 'Can you help me?',
              isCustomer: true,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    type: TextInputType.text,
                    controller: msgController,
                    bgColor: Theme.of(context).backgroundColor,
                    hint: 'Type your message...',
                  ),
                ),
                SizedBox(width: Dimensions.width10/2),
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height10,
                  ),
                  height: Dimensions.height60,
                  width : Dimensions.height60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(Dimensions.height30)
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){},
                      child: Icon(
                        EvaIcons.paperPlane,
                        color: Theme.of(context).scaffoldBackgroundColor
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}