import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/resources/app_fonts.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;
  const ScheduleRowSessionWidget({super.key, required this.configuration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: configuration._style.widgetBackground,
        // gradient: RadialGradient(
        //   center: Alignment(1, -1),
        //   radius: 1.5,
        //   colors: [
        //     Color(0xFF00B90D),
        //     configuration._style.widgetBackground,
        //   ],
        // ),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      padding:
          const EdgeInsets.only(left: 16.0, top: 4.0, right: 4.0, bottom: 16.0),
      // margin: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: _SpeakerWidget(
                configuration: configuration,
              )),
              _FavoriteWidget(configuration: configuration),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: _DescriptionWidget(configuration: configuration),
          ),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;
  const _SpeakerWidget({super.key, required this.configuration});

  @override
  Widget build(BuildContext context) {
    const avatarSize = 24.0;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(avatarSize / 2),
          child: Image.network(
            width: avatarSize,
            height: avatarSize,
            fit: BoxFit.fill,
            configuration.avatarUrl,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            configuration.speakerName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: configuration._style.speakerNameColor,
              fontSize: 14,
              fontFamily: AppFonts.basisGrotesquePro,
              fontWeight: FontWeight.w500,
              height: 1.4285714286,
            ),
          ),
        ),
      ],
    );
  }
}

class _FavoriteWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;
  const _FavoriteWidget({super.key, required this.configuration});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: Image.asset(configuration._favoriteStyle.favoriteButtonIcon,
          color: configuration._favoriteStyle.favoriteButtonColor),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;
  const _DescriptionWidget({super.key, required this.configuration});

  @override
  Widget build(BuildContext context) {
    return Text(
      configuration.sessionTitle,
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: configuration._style.sessionTitleColor,
        fontSize: 18,
        fontFamily: AppFonts.steinbeck,
        fontWeight: FontWeight.w500,
        height: 1.22,
      ),
    );
  }
}

class _ScheduleRowSessionWidgetConfigurationProgressStyle {
  final Color widgetBackground;
  final Color speakerNameColor;
  final Color sessionTitleColor;

  const _ScheduleRowSessionWidgetConfigurationProgressStyle({
    required this.widgetBackground,
    required this.speakerNameColor,
    required this.sessionTitleColor,
  });
}

class _ScheduleRowSessionWidgetConfigurationFavoriteStyle {
  final Color? favoriteButtonColor;
  final Color? widgetBackgroundGradient;
  final String favoriteButtonIcon;

  const _ScheduleRowSessionWidgetConfigurationFavoriteStyle({
    required this.favoriteButtonColor,
    required this.widgetBackgroundGradient,
    required this.favoriteButtonIcon,
  });
}

class ScheduleRowSessionWidgetConfiguration {
  final String avatarUrl;
  final String speakerName;
  final String sessionTitle;
  final bool isFavorite;
  final ScheduleRowWidgetConfigurationProgessStatus progressStatus;

  _ScheduleRowSessionWidgetConfigurationProgressStyle get _style {
    switch (progressStatus) {
      case ScheduleRowWidgetConfigurationProgessStatus.oncoming:

      case ScheduleRowWidgetConfigurationProgessStatus.current:
        return oncomingStyle;
      case ScheduleRowWidgetConfigurationProgessStatus.past:
        return pastStyle;
    }
  }

  _ScheduleRowSessionWidgetConfigurationFavoriteStyle get _favoriteStyle =>
      isFavorite ? isFavoriteStyle : isNotFavoriteStyle;

  const ScheduleRowSessionWidgetConfiguration({
    required this.avatarUrl,
    required this.speakerName,
    required this.sessionTitle,
    required this.isFavorite,
    required this.progressStatus,
  });

  static const oncomingStyle =
      _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackground: Color(0xFF101115),
    speakerNameColor: Color(0xFF52525E),
    sessionTitleColor: Colors.white,
  );
  static const pastStyle = _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackground: Colors.transparent,
    speakerNameColor: Color(0x7A52525E),
    sessionTitleColor: Color(0xFF52525E),
  );

  static const isFavoriteStyle =
      _ScheduleRowSessionWidgetConfigurationFavoriteStyle(
          favoriteButtonColor: Color(0xFF00BD13),
          widgetBackgroundGradient: Color(0xFF00BD13),
          favoriteButtonIcon: AppImages.bookmarkFull);

  static const isNotFavoriteStyle =
      _ScheduleRowSessionWidgetConfigurationFavoriteStyle(
    favoriteButtonColor: null,
    widgetBackgroundGradient: null,
    favoriteButtonIcon: AppImages.bookmark,
  );
}
