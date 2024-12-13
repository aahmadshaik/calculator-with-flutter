import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/calculator_provider.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.black12,
      child: Consumer<CalculatorProvider>(
        builder: (context, provider, child) {
          return Text(
            provider.displayText,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          );
        },
      ),
    );
  }
}
