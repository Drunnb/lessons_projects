import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_session_widget.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_time_widget.dart';

abstract class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({super.key});

  factory ScheduleRowWidget.single({Key? key}) =>
      _ScheduleRowSingleSessionWidget(key: key);
  factory ScheduleRowWidget.multi({Key? key}) =>
      _ScheduleRowMultiSessionWidget(key: key);
}

class _ScheduleRowSingleSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowSingleSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const progressStatus = ScheduleRowWidgetConfigurationProgessStatus.past;
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl: 'https://klike.net/uploads/posts/2019-06/1560329641_2.jpg',
      speakerName: 'Алексей Чулпин',
      sessionTitle: 'Субъективность в оценке дизайна',
      isFavorite: true,
      progressStatus: progressStatus,
    );
    const configurationTime = ScheduleRowTimeWidgetConfiguration(
      startTime: '11:00',
      endTime: '12:00',
      progessStatus: progressStatus,
    );
    return IntrinsicHeight(
      child: Row(
        children: const [
          ScheduleRowTimeWidget(configuration: configurationTime),
          SizedBox(width: 12.0),
          Expanded(
              child: ScheduleRowSessionWidget(configuration: configuration)),
        ],
      ),
    );
  }
}

class _ScheduleRowMultiSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowMultiSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum ScheduleRowWidgetConfigurationProgessStatus {
  oncoming,
  current,
  past,
}
