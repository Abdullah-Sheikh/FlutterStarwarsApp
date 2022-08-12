import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:star_wars/Screens/no_internet.dart';
import 'package:star_wars/Screens/planets_listing.dart';

import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    await Future.delayed(Duration(seconds: 3));

    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      NetworkHelpler networkHelper = NetworkHelpler();
      var planetsData = await networkHelper.getData();

      print(planetsData);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PlanetsListing(planets: planetsData);
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NoInternet();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/star_wars.png'),
            ),
            Expanded(
                child: Lottie.asset('assets/images/splash_animi.json',
                    repeat: false)),
          ],
        ),
      ),
    );
  }
}
