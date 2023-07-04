import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message,
    {String? posActionName,
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
    bool isCancelable = true}) {
  List<Widget> actions = [];
  if (posActionName != null) {
    actions.add(
      TextButton(
        onPressed: () {
          Navigator.pop(context); // to pop the AlertDialog
          if (posAction != null) {
            posAction();
          }
        },
        child: Text(posActionName),
      ),
    );
  }
  if (negActionName != null) {
    actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          if (negAction != null) {
            negAction();
          }
        },
        child: Text(negActionName)));
  }
  showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          content: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: actions,
        );
      },
      barrierDismissible: isCancelable);
}

void showLoading(BuildContext context, String loadingMessage,
    {bool isCancelable = true}) {
  showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 12,
              ),
              Text(
                loadingMessage,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}
