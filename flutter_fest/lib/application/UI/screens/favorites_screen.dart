import 'package:flutter/cupertino.dart';
import 'package:flutter_fest/application/UI/themes/app_colors.dart';
import 'package:flutter_fest/application/UI/themes/app_text_style.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          const _HeaderWidget(),
          const _NotificationConrolWidget(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: ScheduleRowWidget.single(),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 80.0, right: 20.0),
        child: RichText(
          text: TextSpan(
            text: 'Моя\n',
            style: AppTextStyle.stainbeckHeadItalic.copyWith(
              color: AppColors.white88,
              height: 44 / 36,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'программа',
                style: AppTextStyle.stainbeckHeadNormal.copyWith(
                  color: AppColors.white88,
                  height: 44 / 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationConrolWidget extends StatelessWidget {
  const _NotificationConrolWidget();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 28.0,
          right: 20.0,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.darkSecondary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Напомнить мне о лекциях\nза 10 минут до начала',
                    style: AppTextStyle.bookText
                        .copyWith(color: AppColors.white88),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                  right: 20.0,
                ),
                child: Center(
                  child: CupertinoSwitch(
                    activeColor: AppColors.green,
                    trackColor: AppColors.darkText,
                    thumbColor: AppColors.darkSecondary,
                    value: true,
                    onChanged: (_) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
