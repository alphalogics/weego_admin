import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/button/app_fill_button.dart';
import 'debounce.dart';

class MessageDialog extends StatelessWidget {
  MessageDialogType messageType;
  final String mainMessage;
  final List<String> otherMessages;
  int displayTime;
  bool isOkPressed = false;
  bool closeAfterDelay;

  MessageDialog(
      {Key? key,
        this.messageType = MessageDialogType.success,
        required this.mainMessage,
        this.displayTime = 2000,
        this.otherMessages = const [],
        this.closeAfterDelay = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (closeAfterDelay) {
      DebouncerUtil(milliseconds: displayTime).run(() {
        if (!isOkPressed) {
          Get.back();
        }
      });
    }

    var length = otherMessages.length;

    return AlertDialog(
      titlePadding: EdgeInsets.all(15),
      contentPadding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          getAlertIcon(),
          SizedBox(height: 12),
          Text(mainMessage,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          SizedBox(height: 12),
          (otherMessages.isNotEmpty)
              ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100,
                width: double.maxFinite,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: otherMessages.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (index + 1).toString() + '.',
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                              child: Text(otherMessages[index],
                                  style:
                                  TextStyle(color: Colors.blueGrey))),
                        ],
                      );
                    }),
              )
            ],
          )
              : Container(),
          AppFilledButton(
            onPressed: () {
              isOkPressed = true;
              Get.back();
            },
            btnText: 'OK',
          )
        ],
      ),
    );
  }

  getAlertIcon() {
    switch (messageType) {
      case MessageDialogType.info:
        return Icon(Icons.info, size: 48.0, color: Colors.blue);
        break;
      case MessageDialogType.success:
        return Icon(Icons.check_circle, size: 48.0, color: Colors.green);
        break;
      case MessageDialogType.error:
        return Icon(Icons.error, size: 48.0, color: Colors.redAccent);
        break;
      case MessageDialogType.warning:
        return Icon(Icons.warning, size: 48.0, color: Colors.deepOrangeAccent);
        break;
    }
    return Icon(Icons.info, size: 48.0, color: Colors.blue);
  }
}

enum MessageDialogType { info, success, error, warning }

Future showMessageDialog(
    {required MessageDialogType type,
      required String? mainMessage,
      List<String> otherMessages = const [],
      int displayTime = 2000,
      bool closeAfterDelay = true,
      bool barrierDismissible = true}) async {
  await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return MessageDialog(
            mainMessage: mainMessage ?? '',
            messageType: type,
            otherMessages: otherMessages,
            closeAfterDelay: closeAfterDelay,
            displayTime: displayTime);
      },
      barrierDismissible: barrierDismissible);
}
