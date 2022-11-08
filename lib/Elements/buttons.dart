import 'package:flutter/material.dart';

import '../Utils/style.dart';

class BigButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;

  const BigButton(
      {Key? key, required this.title, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? blueColor,
          elevation: 5.0,
          padding: const EdgeInsets.all(13.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        ),
        onPressed: onTap,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;

  const MyButton({Key? key, this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: BigButton(
            color: greenColor,
            title: title ?? 'Next',
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
