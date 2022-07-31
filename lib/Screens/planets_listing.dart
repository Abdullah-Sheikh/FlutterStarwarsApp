import 'package:flutter/material.dart';
import 'package:star_wars/Widgets/character_widget.dart';
import 'package:star_wars/models/character.dart';
import 'package:star_wars/styleguide.dart';

class PlanetsListing extends StatefulWidget {
  PlanetsListing({this.planets});

  final planets;
  @override
  _PlanetsListingState createState() => _PlanetsListingState();
}

class _PlanetsListingState extends State<PlanetsListing> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Star Wars", style: AppTheme.display1),
                    TextSpan(text: "\n"),
                    TextSpan(text: "Planets", style: AppTheme.display2),
                  ]),
                ),
              ),
              Expanded(
                child: PageView(children: <Widget>[
                  for (var i = 0; i < characters.length; i++)
                    CharacterWidget(
                        character: characters[i],
                        planet: widget.planets['results'][i],
                        pageController: _pageController,
                        currentPage: i),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
