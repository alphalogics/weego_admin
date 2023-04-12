import 'package:flutter/cupertino.dart';
import '../card/app_card.dart';
import '../text/app_text.dart';
import 'row_expanded.dart';

class ShowResponseMsg extends StatelessWidget {
  final String? msg;

  ShowResponseMsg({this.msg = 'loading...'});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: RowExpanded(
        child: AppText.bodyThree(msg, align: TextAlign.center,),
      ),
    );
  }
}
