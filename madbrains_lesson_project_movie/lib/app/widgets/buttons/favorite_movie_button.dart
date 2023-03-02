import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/theme/app_colors.dart';

class MovieFavoriteButton extends StatelessWidget {
  final void Function() onPress;
  final bool isFavorite;
  const MovieFavoriteButton({
    Key? key,
    required this.onPress,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 25,
      onPressed: onPress,
      icon: isFavorite
          ? const Icon(
              Icons.favorite,
              size: 25,
              color: Colors.red,
            )
          : const Icon(
              Icons.favorite,
              color: AppColors.mainPurpleColor,
              size: 25,
            ),
    );
  }
}
