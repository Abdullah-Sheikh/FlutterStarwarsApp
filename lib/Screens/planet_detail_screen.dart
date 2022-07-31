import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numeral/numeral.dart';
import 'package:star_wars/Widgets/icon_content.dart';
import 'package:star_wars/Widgets/reusable_card.dart';
import 'package:star_wars/Widgets/terrain_card.dart';
import 'package:star_wars/models/character.dart';
import 'package:star_wars/styleguide.dart';

class PlanetDetailScreen extends StatefulWidget {
  final Character character;
  final planet;
  const PlanetDetailScreen({Key? key, required this.character, this.planet})
      : super(key: key);

  @override
  _PlanetDetailScreenState createState() => _PlanetDetailScreenState();
}

class _PlanetDetailScreenState extends State<PlanetDetailScreen> {
  String name = '';
  int population = 0;
  String orbital_period = '';
  String climate = '';
  String terrain = '';
  String surface_water = '';
  String diameter = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.planet);
  }

  void updateUI(dynamic planet) {
    try {
      name = (planet)['name'];
      String temp = (planet)['population'];
      population = int.parse(temp);
      orbital_period = (planet)['orbital_period'];
      climate = (planet)['climate'];
      terrain = (planet)['terrain'];
      surface_water = (planet)['surface_water'];
      diameter = (planet)['diameter'];
    } catch (e) {
      population = 0;
      name = (planet)['name'];
      orbital_period = (planet)['orbital_period'];
      climate = (planet)['climate'];
      terrain = (planet)['terrain'];
      surface_water = (planet)['surface_water'];
      diameter = (planet)['diameter'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Hero(
          tag: "background-${widget.character.name}",
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.character.colors,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                child: IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 40,
                  color: Colors.white.withOpacity(0.9),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Hero(
                  tag: "image-${widget.character.name}",
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      widget.character.imagePath,
                      height: screenHeight * 0.45,
                      width: screenWidth * 0.9,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: Hero(
                  tag: "name-${widget.character.name}",
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Text(
                        name,
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: Text(
                  'Population: ${Numeral(population).format()}',
                  style: AppTheme.subHeading,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8.0, 8.0, 8.0),
                    child: ReusableCard(
                      cardWidget: IconContent(
                        icon: FontAwesomeIcons.earthAmericas,
                        label: 'Orbital Period',
                        value: orbital_period,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReusableCard(
                      cardWidget: IconContent(
                        icon: FontAwesomeIcons.circleNotch,
                        label: 'Diameter',
                        value: diameter,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8.0, 8.0, 8.0),
                child: TerrainCard(
                  cardWidget: IconContent(
                    icon: FontAwesomeIcons.houseFloodWater,
                    label: 'Terrain',
                    value: terrain,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8.0, 8.0, 8.0),
                    child: ReusableCard(
                      cardWidget: IconContent(
                        icon: FontAwesomeIcons.water,
                        label: 'Surface water',
                        value: surface_water,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReusableCard(
                      cardWidget: IconContent(
                        icon: FontAwesomeIcons.cloudSun,
                        label: 'Climate',
                        value: climate,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35.0,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
