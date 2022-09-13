import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:star_wars/Screens/loading_screen.dart';
import 'package:star_wars/styleguide.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Expanded(
                child: Lottie.asset(
              'assets/images/no_internet_animi.json',
            )),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  onPressed: () async {
                    bool result =
                        await InternetConnectionChecker().hasConnection;
                    if (result == true) {
                      if (!mounted) return;
                      Navigator.popUntil(context, (route) => false);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoadingScreen();
                      }));
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // <-- Radius
                      ),
                      padding: const EdgeInsets.fromLTRB(36, 12, 36, 12)),
                  child: Text(
                    'Retry',
                    style: AppTheme.subHeading,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
