import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  const CustomElevatedButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4280EF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child:
                  Text(buttonText, style: const TextStyle(color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  const CustomOutlinedButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1, color: Color(0xFF4280EF)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(buttonText,
                  style: const TextStyle(color: Color(0xFF4280EF))),
            ),
          ),
        )
      ],
    );
  }
}
