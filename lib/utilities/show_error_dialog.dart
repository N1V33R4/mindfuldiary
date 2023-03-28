import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String msg) {
  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('An error occurred'),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
