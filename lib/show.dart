import 'package:flutter/material.dart';

import 'MyTheme.dart';

void showMessageDialog(BuildContext context, String message,
    {String? buttonTextOne,
    VoidCallback? buttonActionOne,
    String? buttonTextTwo,
    VoidCallback? buttonActionTwo,
    bool isCanceLable = true}) {
  List<Widget> actions = [];
  if (buttonTextOne != null) {
    actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          buttonActionOne;
        },
        child: Text(buttonTextOne)));
  }
  if (buttonTextTwo != null) {
    actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          buttonActionTwo;
        },
        child: Text(buttonTextTwo)));
  }

  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
            contentTextStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: MyTheme.blackColor),
            content: Text(
              message,
            ),
            actions: actions);
      },
      barrierDismissible: isCanceLable);
}

void showLoadingDialog(BuildContext context, String loadingMessage,
    {bool isCancelLabel = true}) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 15,
              ),
              Text(loadingMessage,
                  style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        );
      },
      barrierDismissible: isCancelLabel);
}

void hideLoadingDialog(BuildContext context) {
  Navigator.pop(context);
}
