import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/utils/helpers/dimensions.dart';

class ChatContainer extends StatelessWidget {
  final String text;
  final bool isCustomer;
  const ChatContainer({Key? key, required this.text, required this.isCustomer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCustomer ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
      child: Container(
        margin: EdgeInsets.only(
          bottom: Dimensions.height10,
          right: isCustomer ? 0.0 : Dimensions.width120,
          left: isCustomer ? Dimensions.width120 : 0.0,
        ),
        padding: EdgeInsets.all(Dimensions.height10),
        decoration: BoxDecoration(
          color: isCustomer ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(Dimensions.radius10),
            topStart: Radius.circular(Dimensions.radius10),
            bottomStart: isCustomer ? Radius.circular(Dimensions.radius10) : Radius.zero,
            bottomEnd: isCustomer ? Radius.zero : Radius.circular(Dimensions.radius10),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: Dimensions.font18,
            color: isCustomer
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).primaryColorLight
          ),
        ),
      ),
    );
  }
}