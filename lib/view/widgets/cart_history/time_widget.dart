import 'package:store_app/models/cart.dart';
import 'package:store_app/view/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeWidget extends StatelessWidget {
  final int index;
  final List<CartModel> getCartHistoryList;
  const TimeWidget(
      {Key? key, required this.index, required this.getCartHistoryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outputDate = DateTime.now().toString();
    if(index < getCartHistoryList.length){
      DateTime date = DateFormat('yyyy-MM-dd hh:mm:ss')
        .parse(getCartHistoryList[index].time!);
      var outputFormat = DateFormat('dd/MM/yy hh:mm a');
      outputDate = outputFormat.format(date);
    }
    
    return BigText(text: outputDate, color: Theme.of(context).primaryColorLight);
  }
}
