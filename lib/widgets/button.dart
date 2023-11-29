import 'package:flutter/material.dart';
import 'package:packingticketingsystem/utils/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double height;
  const CustomElevatedButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.height = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: kLeadBlack,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Ink(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: height,
        decoration: BoxDecoration(
          color: kLeadBlack,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: "NunitoSans",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CheckInButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isChecked;
  final double height;
  const CheckInButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.isChecked,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: kLeadBlack,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Ink(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: height,
        decoration: BoxDecoration(
          color: isChecked ? const Color(0xffF5F5F5) : kLeadBlack,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: "NunitoSans",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isChecked ? kLeadBlack : Colors.white),
          ),
        ),
      ),
    );
  }
}

class HelpButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double height;
  const HelpButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: kLeadBlack,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Ink(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: height,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 189, 54, 54),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: "NunitoSans",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}