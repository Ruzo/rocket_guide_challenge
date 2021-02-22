import 'package:flutter/material.dart';
import 'package:rocket_guide/models/models/rocket.dart';
import 'package:rocket_guide/rocket_details/rocket_details_screen.dart';

class RocketBox extends StatelessWidget {
  final Rocket rocket;

  const RocketBox({Key key, @required this.rocket}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String rocketImage = rocket.flickrImages.isEmpty ? 'https://loremflickr.com/640/360' : rocket.flickrImages[0];
    return ListTile(
      leading: Image.network(
        rocketImage,
        width: 100,
        fit: BoxFit.cover,
      ),
      title: Text(rocket.name),
      subtitle: Text(
        rocket.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(Icons.arrow_right),
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RocketDetailsScreen(rocket: rocket))),
    );
  }
}
