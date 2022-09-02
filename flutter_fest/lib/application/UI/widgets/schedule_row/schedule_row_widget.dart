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
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl: 'https://klike.net/uploads/posts/2019-06/1560329641_2.jpg',
      speakerName: 'Алексей Чулпин',
      sessionTitle: 'Субъективность в оценке дизайна',
      isFavorite: true,
      progressStatus: ScheduleRowWidgetConfigurationProgessStatus.oncoming,
    );
    return SizedBox(
      height: 100,
      child: CustomMultiChildLayout(
        delegate: RowLayoutDelegate(),
        children: [
          LayoutId(id: 1, child: const ScheduleRowTimeWidget()),
          LayoutId(
              id: 2,
              child:
                  const ScheduleRowSessionWidget(configuration: configuration)),
        ],
      ),
    );
  }
}

class RowLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    const firstChildWidth = 48.0;
    const spaceChildWidth = 12.0;
    const secondChildXoffset = firstChildWidth + spaceChildWidth;

    var secondChildSize = Size.zero;

    if (hasChild(2)) {
      final maxWidth = size.width - secondChildXoffset; // ????
      secondChildSize = layoutChild(
        2,
        BoxConstraints(
          maxWidth: maxWidth,
        ),
      );
    }
    if (hasChild(1)) {
      final maxHeight = max(secondChildSize.height, 90.0);
      layoutChild(
        1,
        BoxConstraints(
          maxWidth: firstChildWidth,
          maxHeight: maxHeight,
        ),
      );
    }

    positionChild(1, Offset.zero);
    positionChild(2, const Offset(secondChildXoffset, 0));
  }

  @override
  bool shouldRelayout(covariant RowLayoutDelegate oldDelegate) {
    return true;
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
