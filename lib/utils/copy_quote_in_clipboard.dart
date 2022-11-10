import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_quotes_app/modals/quot.dart';

copyQuoteInClipBoard(
    {required BuildContext context, required QuotDB res}) async {
  await Clipboard.setData(
    ClipboardData(
      text: """Quote : "${res.quot}"\n Author : ${res.author}""",
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.blue,
      content: Text("Quote Copy Successfully.."),
    ),
  );
}
