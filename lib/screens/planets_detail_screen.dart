import 'package:flutter/material.dart';
import 'package:pylot/models/models.dart';
import 'package:pylot/widgets/planet_details.dart';

class PlanetDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    Planet quizzes = args.message;
    return Scaffold(
      appBar: AppBar(
        title: Text("${args.title} Overview"),
      ),
      body: PlanetDetails(
        title: args.title,
        description: quizzes.description,
        image: quizzes.image,
        links: quizzes.links,
      ),
    );
  }
}
