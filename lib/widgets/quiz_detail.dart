import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/blocs.dart';
import 'package:pylot/models/models.dart';
import 'package:pylot/utils/utils.dart';

class QuizDetail extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String planet;
  final List<String> links;
  final Function onPressed;

  QuizDetail(
      {this.image,
      this.title,
      this.description,
      this.links,
      this.planet,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BlocBuilder<AnimationsBloc, AnimationsState>(
          builder: (context, state) {
            if (state is AnimationsLoaded) {
              if (state.animationsModel.animations == Animations.off) {
                return CachedNetworkImage(
                  imageUrl: image,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                );
              }
              return Hero(
                tag: title,
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              );
            }
            return Hero(
              tag: title,
              child: CachedNetworkImage(
                imageUrl: image,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Study guide",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 16,
              ),
              FlatButton(
                child: Text("planet overview".toUpperCase()),
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    StringResources.webPlanetScreenId,
                    arguments: ScreenArguments(title: title, message: links[0]),
                  );
                },
              ),
              FlatButton(
                child: Text(
                  "source image".toUpperCase(),
                ),
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    StringResources.webPlanetScreenId,
                    arguments: ScreenArguments(title: title, message: links[1]),
                  );
                },
              ),
              SizedBox(
                height: 24,
              ),
              ButtonBar(
                buttonPadding: EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  BlocBuilder<QuestionBloc, QuestionState>(
                    builder: (context, state) {
                      return RaisedButton(
                        child: Text("start exam".toUpperCase()),
                        onPressed: onPressed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
