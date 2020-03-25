import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pylot/blocs/animations/animations_state.dart';
import 'package:pylot/blocs/animations/bloc.dart';
import 'package:pylot/models/animations/animtions_enum.dart';
import 'package:pylot/models/models.dart';
import 'package:pylot/utils/strings_resources.dart';

class PlanetListItem extends StatelessWidget {
  final Planet planet;

  PlanetListItem({@required this.planet}) : assert(planet != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          StringResources.planetDetailsScreenId,
          arguments: ScreenArguments(
            title: planet.planet,
            message: planet,
          ),
        );
      },
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: BlocBuilder<AnimationsBloc, AnimationsState>(
            builder: (context, state) {
              if (state is AnimationsLoaded) {
                if (state.animationsModel.animations == Animations.off) {
                  return CachedNetworkImage(
                    imageUrl: planet.image,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.2,
                    fit: BoxFit.cover,
                  );
                }
              }
              return Hero(
                tag: planet.planet,
                child: CachedNetworkImage(
                  imageUrl: planet.image,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        title: Text(planet.planet),
      ),
    );
  }
}
