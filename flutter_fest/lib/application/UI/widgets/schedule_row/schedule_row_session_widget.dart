import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/app_fonts.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  const ScheduleRowSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF101115),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      padding:
          const EdgeInsets.only(left: 16.0, top: 4.0, right: 4.0, bottom: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(child: _SpeakerWidget()),
              _FavoriteWidget(),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: _DescriptionWidget(),
          ),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  const _SpeakerWidget({super.key});

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
            'https://klike.net/uploads/posts/2019-06/1560329641_2.jpg',
          ),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Text(
            'Иннокентий Христорожденный sdsdaasdsdasdasdaasdasd',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
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
  const _FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: Image.asset(AppImages.bookmark),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Название Лекции Название лекции Название лекции',
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.white.withOpacity(0.88),
        fontSize: 18,
        fontFamily: AppFonts.steinbeck,
        fontWeight: FontWeight.w500,
        height: 1.22,
      ),
    );
  }
}
