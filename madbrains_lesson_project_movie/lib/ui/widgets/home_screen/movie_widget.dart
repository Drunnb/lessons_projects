import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/domain/entity/entity_movie.dart';
import 'package:madbrains_lesson_project_movie/ui/theme/app_colors.dart';

class MovieWidget extends StatelessWidget {
  final String title;
  final String picture;
  final String description;
  final Language language;
  const MovieWidget({
    Key? key,
    required this.title,
    required this.picture,
    required this.description,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle myStyleDescriprionText = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 350,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.mainPurpleColor,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PosterWidget(picture: picture),
                WidgetTextAboutAllInformation(
                    title: title,
                    language: language,
                    description: description,
                    myStyleDescriprionText: myStyleDescriprionText)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WidgetTextAboutAllInformation extends StatelessWidget {
  const WidgetTextAboutAllInformation({
    super.key,
    required this.title,
    required this.language,
    required this.description,
    required this.myStyleDescriprionText,
  });

  final String title;
  final Language language;
  final String description;
  final TextStyle myStyleDescriprionText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              language.toPrettyString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              description,
              style: myStyleDescriprionText,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.picture,
  });

  final String picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              picture,
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: AppColors.mainPurpleColor,
            offset: Offset(0, 2),
            blurStyle: BlurStyle.solid,
          ),
        ],
      ),
    );
  }
}
