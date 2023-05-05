import 'package:flutter/material.dart';
import 'package:mindfuldiary/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Sign out',
    content: 'Are you sure you want to sign out?',
    optionsBuilder: () => {
      'Cancel': false,
      'Logout': true,
    },
  ).then((value) => value ?? false);
}

// Future<bool> showLogOutDialog(BuildContext context) {
//   return showDialog<bool>(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Sign out'),
//       content: const Text('Are you sure you want to sign out?'),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(false),
//           child: const Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(true),
//           child: const Text('Logout'),
//         ),
//       ],
//     ),
//   ).then((value) => value ?? false);
// }
