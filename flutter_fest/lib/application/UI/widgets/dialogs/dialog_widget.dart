import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/themes/app_colors.dart';
import 'package:flutter_fest/application/UI/themes/app_text_style.dart';

class DialogActionConfiguration {
  final String title;
  final VoidCallback action;
  final bool isCancel;

  const DialogActionConfiguration(this.title, this.isCancel, this.action);
}

class DialogConfiguration {
  final String title;
  final List<DialogActionConfiguration> actions;

  DialogConfiguration({
    required this.title,
    required this.actions,
  });
}

class DialogWidget extends StatelessWidget {
  final DialogConfiguration configuration;
  const DialogWidget({
    super.key,
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    final dialog = Platform.isIOS
        ? _CupertinoDialogWidget(configuration: configuration)
        : _MaterialDialogWidget(configuration: configuration);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Theme(
        data: ThemeData.dark(),
        child: dialog,
      ),
    );
  }

  static Future<T?> show<T>(
      BuildContext context, DialogConfiguration configuration) {
    return showDialog<T>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (_) => DialogWidget(configuration: configuration),
    );
  }
}

class _MaterialDialogWidget extends StatelessWidget {
  final DialogConfiguration configuration;
  const _MaterialDialogWidget({
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    final actionWidget = configuration.actions
        .map((config) => _ActionWidget(configuration: config))
        .toList();
    return AlertDialog(
      title: _TitleWidget(title: configuration.title),
      actions: actionWidget,
    );
  }
}

class _CupertinoDialogWidget extends StatelessWidget {
  final DialogConfiguration configuration;

  const _CupertinoDialogWidget({
    required this.configuration,
  });

  @override
  Widget build(BuildContext context) {
    final actionWidget = configuration.actions
        .map((config) => _ActionWidget(configuration: config))
        .toList();
    return CupertinoAlertDialog(
      title: _TitleWidget(title: configuration.title),
      actions: actionWidget,
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
  const _ActionWidget({required this.configuration});

  @override
  Widget build(BuildContext context) {
    final style = configuration.isCancel
        ? AppTextStyle.dialogCancelAction
        : AppTextStyle.dialogAction;
    return TextButton(
      onPressed: configuration.action,
      child: Text(
        configuration.title,
        style: style.copyWith(color: AppColors.green),
      ),
    );
  }
}
