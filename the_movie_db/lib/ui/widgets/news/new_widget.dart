import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/widgets/news/news_widget_free_to_watch.dart';
import 'package:the_movie_db/ui/widgets/news/news_widget_leaderboards.dart';
import 'package:the_movie_db/ui/widgets/news/news_widget_popular.dart';
import 'package:the_movie_db/ui/widgets/news/news_widget_trailers.dart';
import 'package:the_movie_db/ui/widgets/news/news_widget_trandings.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsWidgetPopular(),
        NewsWidgetFreeToWatch(),
        NewsWidgetTrailers(),
        NewsWidgetTrandings(),
        NewsWidgetLeaderboards(),
      ],
    );
  }
}
