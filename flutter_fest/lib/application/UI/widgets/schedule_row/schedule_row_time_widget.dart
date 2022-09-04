import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/themes/app_colors.dart';
import 'package:flutter_fest/application/UI/themes/app_text_style.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_widget.dart';

class ScheduleRowTimeWidget extends StatelessWidget {
  final ScheduleRowTimeWidgetConfiguration configuration;

  const ScheduleRowTimeWidget({super.key, required this.configuration});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Text(
                configuration.startTime,
                style: AppTextStyle.bookTextSmall
                    .copyWith(color: configuration._style.startColor),
                maxLines: 1,
              ),
              const Spacer(),
              Text(
                configuration.endTime,
                style: AppTextStyle.bookTextSmall
                    .copyWith(color: configuration._style.endColor),
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(width: 12.0),
          Column(
            children: [
              Expanded(
                  child: _DeviderWidget(
                      color: configuration._style.startColor,
                      position: _DeviderWidgetPosition.top)),
              Expanded(
                  child: _DeviderWidget(
                      color: configuration._style.endColor,
                      position: _DeviderWidgetPosition.bottom)),
            ],
          ),
        ],
      ),
    );
  }
}

enum _DeviderWidgetPosition { top, bottom }

class _DeviderWidget extends StatelessWidget {
  final _DeviderWidgetPosition position;
  final Color color;

  const _DeviderWidget({
    required this.color,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(1.0);
    final borderRadius = position == _DeviderWidgetPosition.top
        ? const BorderRadius.only(topLeft: radius, topRight: radius)
        : const BorderRadius.only(bottomLeft: radius, bottomRight: radius);
    return SizedBox(
        width: 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
          child: Container(),
        ));
  }
}

class _ScheduleRowTimeWidgetConfigurationProgressStyle {
  final Color startColor;
  final Color endColor;

  const _ScheduleRowTimeWidgetConfigurationProgressStyle({
    required this.startColor,
    required this.endColor,
  });
}

class ScheduleRowTimeWidgetConfiguration {
  final String startTime;
  final String endTime;

  final ScheduleRowWidgetConfigurationProgessStatus progessStatus;

  const ScheduleRowTimeWidgetConfiguration({
    required this.startTime,
    required this.endTime,
    required this.progessStatus,
  });
  _ScheduleRowTimeWidgetConfigurationProgressStyle get _style {
    switch (progessStatus) {
      case ScheduleRowWidgetConfigurationProgessStatus.oncoming:
        return oncomingStyle;
      case ScheduleRowWidgetConfigurationProgessStatus.current:
        return inProgressStyle;
      case ScheduleRowWidgetConfigurationProgessStatus.past:
        return pastStyle;
    }
  }

  static const oncomingStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: AppColors.white72,
    endColor: AppColors.white72,
  );
  static const pastStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: AppColors.darkText72,
    endColor: AppColors.darkText72,
  );
  static const inProgressStyle =
      _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: AppColors.darkText72,
    endColor: AppColors.green72,
  );
}
