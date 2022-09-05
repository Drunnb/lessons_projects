import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/themes/app_text_style.dart';

class TopTextNotificationWidget extends StatelessWidget {
  final String text;
  const TopTextNotificationWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
          child: Text(
        text,
        style: AppTextStyle.snackText.copyWith(color: Colors.black),
        maxLines: null,
      )),
    );
  }
}
