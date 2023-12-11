import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<void> error_dialog({required BuildContext context, required String title, required String content}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title, style: const TextStyle(fontSize: 12)),
        content: Text(content, style: const TextStyle(fontSize: 12)),
        actions: [
          GestureDetector(
            child: const Text('close', style: TextStyle(fontSize: 12)),
            onTap: () async {
              Navigator.pop(context);
              return;
            },
          ),
        ],
      );
    },
  );
}
