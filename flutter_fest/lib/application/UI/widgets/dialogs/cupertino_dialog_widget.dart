import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/themes/app_text_style.dart';

import '../../themes/app_colors.dart';

class DialogActionConfiguration {
  final String title;
  final VoidCallback action;
  final bool isCancel;

  const DialogActionConfiguration(this.title, this.isCancel, this.action);
}

class CupertinoDialogWidget extends StatelessWidget {
  final String title;
  final List<DialogActionConfiguration> actions;

  const CupertinoDialogWidget({
    super.key,
    required this.title,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final actionWidget =
        actions.map((config) => _ActionWidget(configuration: config)).toList();
    return Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: _TitleWidget(title: title),
        actions: actionWidget,
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String title;
  const _TitleWidget({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.dialogTitle,
    );
  }
}

class _ActionWidget extends StatelessWidget {
  final DialogActionConfiguration configuration;
  const _ActionWidget({super.key, required this.configuration});

  @override
  Widget build(BuildContext context) {
    final style = configuration.isCancel
        ? AppTextStyle.dialogCancelAction
        : AppTextStyle.dialogAction;
    return TextButton(
      child: Text(
        configuration.title,
        style: style.copyWith(color: AppColors.green),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
