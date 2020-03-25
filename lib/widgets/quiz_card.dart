import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/animations/bloc.dart';
import 'package:pylot/models/animations/animations.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Function onTap;

  QuizCard({
    @required this.title,
    @required this.description,
    @required this.image,
    this.onTap,
  })  : assert(title != null),
        assert(description != null),
        assert(image != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.42,
      child: Card(
        margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: InkWell(
          onTap: onTap ?? null,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0),
                ),
                child: BlocBuilder<AnimationsBloc, AnimationsState>(
                  builder: (context, state) {
                    if (state is AnimationsLoaded) {
                      if (state.animationsModel.animations == Animations.off) {
                        return CachedNetworkImage(
                          imageUrl: image,
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.cover,
                        );
                      }
                    }
                    return Hero(
                      tag: title,
                      child: CachedNetworkImage(
                        imageUrl: image,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline,
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
