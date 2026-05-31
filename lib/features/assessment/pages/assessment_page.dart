import 'package:flutter/material.dart';
import '../widgets/top_nav.dart';
import '../widgets/weight_question.dart';
import '../widgets/height_question.dart';
import '../widgets/age_question.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  State<AssessmentPage> createState() => AssessmentPageState();
}

class AssessmentPageState extends State<AssessmentPage> {
  bool isKg = true;
  double currentWeight = 68;
  double currentHeight = 175;
  double currentAge = 25;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    final currentPage = _pageController.page?.round() ?? 0;
    if (currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const TopNav(),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  WeightQuestion(
                    isKg: isKg,
                    currentValue: currentWeight,
                    onUnitToggle: () => setState(() => isKg = !isKg),
                    onValueChanged: (value) => setState(() => currentWeight = value),
                    onContinue: _handleContinue,
                  ),
                  HeightQuestion(
                    isKg: isKg,
                    currentValue: currentHeight,
                    onUnitToggle: () => setState(() => isKg = !isKg),
                    onValueChanged: (value) => setState(() => currentHeight = value),
                    onContinue: _handleContinue,
                  ),
                  AgeQuestion(
                    currentValue: currentAge,
                    onValueChanged: (value) => setState(() => currentAge = value),
                    onContinue: _handleContinue,
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
