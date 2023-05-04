import 'package:flutter/material.dart';
import 'package:mindfuldiary/utilities/generic_dialog.dart';

Future<void> showErrorDialog(BuildContext context, String msg) {
  return showGenericDialog<void>(
    context: context,
    title: 'An error occurred',
    content: msg,
    optionsBuilder: () => {
      'OK': null,
    },
  );
}

// non-generic implementation
// Future<void> showErrorDialog(BuildContext context, String msg) {
//   return showDialog<void>(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('An error occurred'),
//       content: Text(msg),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }
