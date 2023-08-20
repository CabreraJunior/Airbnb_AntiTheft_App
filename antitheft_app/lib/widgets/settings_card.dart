import 'package:antitheft_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String text;
  final IconData icon;
  const SettingsCard({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Constants().appColor, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 12,
          ),
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(
            height: 12,
          ),
          Text(text)
        ],
      ),
    );
  }
}
