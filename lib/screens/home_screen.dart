import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/calculator_provider.dart';
import '../widgets/calculator_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center, // Center the title horizontally
          child: Text(
            "Aslam's Calculator",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true, // Centers the title horizontally
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 140), // Space between AppBar title and input field
            // Display the calculation result
            Consumer<CalculatorProvider>(
              builder: (context, provider, child) {
                return Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    // Background color for the display area
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Text(
                    provider.displayText,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 40), // Add space between input field and buttons
            Expanded(
              child: Column(
                children: [
                  // First grid for buttons except "="
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // 4 buttons per row
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1, // Ensures square buttons
                      ),
                      itemCount: 16, // Total items excluding "="
                      itemBuilder: (context, index) {
                        return CalculatorButton(index: index);
                      },
                    ),
                  ),
                  // Full-width "=" button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<CalculatorProvider>(context, listen: false)
                            .evaluateExpression();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 62, 61, 61),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: Text(
                        '=',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
