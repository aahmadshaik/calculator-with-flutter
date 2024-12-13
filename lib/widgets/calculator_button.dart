import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/calculator_provider.dart';

class CalculatorButton extends StatelessWidget {
  final int index;

  CalculatorButton({required this.index});

  @override
  Widget build(BuildContext context) {
    final List<String> buttons = [
      '7', '8', '9', '/', '4', '5', '6', 'x', '1', '2', '3', '-',
      '0', 'C', '%', '+', '.', '=' // Button text
    ];

    String buttonText = buttons[index];

    // Determine if the button is a number
    bool isNumber = '0123456789'.contains(buttonText);

    return ElevatedButton(
      onPressed: () {
        final calculatorProvider =
            Provider.of<CalculatorProvider>(context, listen: false);

        if (buttonText == 'C') {
          calculatorProvider.clearDisplay();
        } else if (buttonText == '=') {
          calculatorProvider.evaluateExpression();
        } else if (buttonText == '.') {
          // Prevent adding multiple decimal points
          if (!calculatorProvider.displayText.contains('.')) {
            calculatorProvider
                .updateDisplay(calculatorProvider.displayText + buttonText);
          }
        } else if (buttonText == '%') {
          // Calculate percentage (e.g., 50% -> 0.5, 200% -> 2.0)
          double currentValue =
              double.tryParse(calculatorProvider.displayText) ?? 0.0;
          double percentageValue = currentValue / 100;
          calculatorProvider.updateDisplay(percentageValue.toString());
        } else {
          // Add normal button press functionality
          calculatorProvider
              .updateDisplay(calculatorProvider.displayText + buttonText);
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: buttonText == '='
            ? Colors.white // Set the background color of '=' button to white
            : isNumber
                ? Colors.white // Light background for numbers
                : Colors.blue, // Different color for non-numeric buttons
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: buttonText == '='
              ? Colors.black // Set the text color of '=' button to black
              : isNumber
                  ? Colors.black // Text color for numbers
                  : Colors.white, // Text color for non-numeric buttons
        ),
      ),
    );
  }
}
