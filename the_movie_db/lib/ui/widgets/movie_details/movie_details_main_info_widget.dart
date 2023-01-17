import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/domain/api_client/image_downloader.dart';
import 'package:the_movie_db/ui/navigation/main_navigation_route_name.dart';
import 'package:the_movie_db/ui/widgets/elements/radial_percent_widget.dart';
import 'package:the_movie_db/ui/widgets/movie_details/movie_details_model.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: _PeopleWidget(),
        ),
      ],
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget();

  @override
  Widget build(BuildContext context) {
    final overview =
        context.select((MovieDetailsModel model) => model.data.overview);
    return Text(
      overview,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailsModel>();
    final posterData =
        context.select((MovieDetailsModel model) => model.data.posterData);
    final backdropPath = posterData.backdropPath;
    final posterPath = posterData.posterPath;
    return AspectRatio(
      aspectRatio: 390 / 219,
      child: Stack(
        children: [
          if (backdropPath != null)
            Image.network(ImageDownloader.imageUrl(backdropPath)),
          if (posterPath != null)
            Positioned(
              top: 20.0,
              left: 20.0,
              bottom: 20.0,
              child: Image.network(ImageDownloader.imageUrl(posterPath)),
            ),
          Positioned(
            top: 5.0,
            right: 5.0,
            child: IconButton(
              icon: Icon(posterData.favoriteIcon),
              color: Colors.cyanAccent,
              onPressed: () => model.toggleFavorite(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget();

  @override
  Widget build(BuildContext context) {
    var data = context.select((MovieDetailsModel model) => model.data.nameData);

    return Center(
      child: RichText(
        maxLines: 3,
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: data.name,
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: data.year,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget();

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        context.select((MovieDetailsModel model) => model.data.scoreData);
    final trailerKey = movieDetails.trailerKey;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: RadialPercentWidget(
                    percent: movieDetails.voteAverage / 100,
                    fillColor: const Color.fromARGB(255, 10, 23, 25),
                    lineColor: const Color.fromARGB(255, 137, 203, 103),
                    freeColor: const Color.fromARGB(255, 25, 54, 31),
                    lineWidth: 3,
                    child: Text(movieDetails.voteAverage.toStringAsFixed(0)),
                  ),
                ),
                const SizedBox(width: 10.0),
                const Text('User Score'),
              ],
            )),
        Container(color: Colors.grey, width: 1.0, height: 15.0),
        if (trailerKey != null)
          TextButton(
              onPressed: () => Navigator.of(context).pushNamed(
                    MainNavigationRouteNames.movieTrailerWidget,
                    arguments: trailerKey,
                  ),
              child: Row(
                children: const [
                  Icon(Icons.play_arrow),
                  Text('Play Trailer'),
                ],
              )),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget();

  @override
  Widget build(BuildContext context) {
    final symmary =
        context.select((MovieDetailsModel model) => model.data.summary);
    return ColoredBox(
      color: const Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Text(
          symmary,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget();

  @override
  Widget build(BuildContext context) {
    var crew =
        context.select((MovieDetailsModel model) => model.data.peopleData);

    return Column(
        children: crew
            .map(
              (chunk) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _PeopleWidgetRow(employee: chunk),
              ),
            )
            .toList());
  }
}

class _PeopleWidgetRow extends StatelessWidget {
  final List<MovieDetailsMoviePeopleData> employee;
  const _PeopleWidgetRow({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: employee
          .map((employee) => _PeopleWidgetRowItem(employee: employee))
          .toList(),
    );
  }
}

class _PeopleWidgetRowItem extends StatelessWidget {
  final MovieDetailsMoviePeopleData employee;
  const _PeopleWidgetRowItem({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    );
    const jobTitleStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    );
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(employee.name, style: nameStyle),
          Text(employee.job, style: jobTitleStyle),
        ],
      ),
    );
  }
}
