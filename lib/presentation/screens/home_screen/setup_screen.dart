import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/widget/home_page_widgets/circular_page_number_widget.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const CircularPageNumberIndicatorWidget(
                  pageNumber: 1,
                  isSelected: true,
                ),
                const CircularPageNumberIndicatorWidget(pageNumber: 2),
                const CircularPageNumberIndicatorWidget(pageNumber: 3),
                const CircularPageNumberIndicatorWidget(pageNumber: 4),
                const CircularPageNumberIndicatorWidget(pageNumber: 5),
                Spacer(),
                TextButton(
                  child: const Text(
                    "Skip",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
