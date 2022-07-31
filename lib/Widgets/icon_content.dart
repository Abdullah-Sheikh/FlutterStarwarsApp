import 'package:flutter/material.dart';
import 'package:star_wars/styleguide.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Text(
            label,
            style: AppTheme.label,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 8.0, left: 8.0, top: 4.0, bottom: 4.0),
          child: Text(
            value,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
                fontSize: 22.0),
          ),
        )
      ],
    );
  }
}
