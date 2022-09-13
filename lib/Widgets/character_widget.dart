import 'package:flutter/material.dart';
import 'package:star_wars/Screens/planet_detail_screen.dart';
import 'package:star_wars/models/character.dart';
import 'package:star_wars/styleguide.dart';

class CharacterWidget extends StatefulWidget {
  final Character character;
  final PageController pageController;
  final int currentPage;
  final dynamic planet;
  const CharacterWidget(
      {Key? key,
      required this.character,
      required this.planet,
      required this.pageController,
      required this.currentPage})
      : super(key: key);

  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  String name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.planet);
  }

  void updateUI(dynamic planet) {
    name = (planet)['name'];
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, _, __) => PlanetDetailScreen(
                    character: widget.character, planet: widget.planet)));
      },
      child: AnimatedBuilder(
          animation: widget.pageController,
          builder: (context, child) {
            double value = 1;

            if (widget.pageController.hasClients &&
                widget.pageController.position.haveDimensions) {
              value = widget.pageController.page! - widget.currentPage;
              value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
              if (widget.currentPage == 0) {
                debugPrint('$value');
              }
            }

            return Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: CharacterCardBackgroundClipper(),
                    child: Hero(
                      tag: "background-${widget.character.name}",
                      child: Container(
                        height: screenHeight * 0.55,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: widget.character.colors,
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.5),
                  child: Hero(
                    tag: "image-${widget.character.name}",
                    child: Image.asset(
                      widget.character.imagePath,
                      height: 0.5 * screenHeight * value,
                      width: screenWidth * 0.85,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 16.0, left: 48.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Hero(
                        tag: "name-${widget.character.name}",
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            name,
                            style: AppTheme.heading,
                          ),
                        ),
                      ),
                      Text(
                        'Tap to see details',
                        style: AppTheme.subHeading,
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
