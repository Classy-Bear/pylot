import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/animations/bloc.dart';
import 'package:pylot/models/models.dart';
import 'package:pylot/utils/strings_resources.dart';

class PlanetDetails extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final List<String> links;

  PlanetDetails({this.image, this.title, this.description, this.links});

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
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.body1,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              FlatButton(
                child: Text(
                  "More about $title in Wikipedia".toUpperCase(),
                ),
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
                  "In Depth by NASA".toUpperCase(),
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
                height: 32,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
