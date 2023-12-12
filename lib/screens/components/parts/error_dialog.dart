import 'package:flutter/material.dart';

import 'kiwi_text.dart';

// ignore: non_constant_identifier_names
Future<void> error_dialog({required BuildContext context, required String title, required String content}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: KiwiText(text: title),
        content: KiwiText(text: content),
        actions: [
          GestureDetector(
            child: const KiwiText(text: 'close'),
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
