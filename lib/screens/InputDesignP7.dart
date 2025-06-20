import 'package:flutter/material.dart';
import '../widgets/InputDesign.dart'; // Classe pour une réponse correcte
import '../widgets/InputDesign2.dart'; // Classe pour une réponse incorrecte
import '../widgets/ThemeConstantsScreen.dart';
//                                              الأسئلة
class InputDesignP7 extends StatelessWidget {
  const InputDesignP7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          color: ThemeConstants.backgroundColor,
          child: SafeArea(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 450),
                decoration: BoxDecoration(
                  color: ThemeConstants.backgroundColor,
                  borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
                ),
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildHeroSection(context),
                    _buildQuestionSection(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeConstants.defaultPadding,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: ThemeConstants.headerColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'رفيق التعلم',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE6D5CA),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "assets/studye.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ThemeConstants.defaultPadding,
        vertical: MediaQuery.of(context).size.width > 20 ? 15 : 15,
      ),
      color: ThemeConstants.primaryColor,
      child: Column(
        children: [
          Text(
            'مادة الرياضيات:',
            style: ThemeConstants.getTitleStyle(context).copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'التمرين الأول :',
            style: ThemeConstants.getTitleStyle(context).copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'يملك أحمد قطعة أرض مستطيلة الشكل، طولها 25 مترًا وعرضها 15 مترًا. '
                'يريد أحمد أن يحيط الأرض بسياج من الأسلاك، وأن يغطي سطحها بالكامل بالعشب',
            style: ThemeConstants.getQuestionStyle(context).copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionSection(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ThemeConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: ThemeConstants.secondaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  '1. ما هو محيط قطعة الأرض؟',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildAnswerGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerGrid(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 640;

    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isSmallScreen ? 1 : 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 40,
      ),
      children: [
        _buildAnswerButton(context, 'أ) 80 مترًا', 127, true),  // Bonne réponse
        _buildAnswerButton(context, 'ج) 100 مترً', 147, false),
        _buildAnswerButton(context, 'ب) 70 مترًا', 51, false),
        _buildAnswerButton(context, 'د) 90 مترًا', 123, false),
      ],
    );
  }

  Widget _buildAnswerButton(BuildContext context, String text, double radius, bool isCorrect) {
    return ElevatedButton(
      onPressed: () {
        if (isCorrect) {
          _showCorrectAnswerDialog(context);
        } else {
          _showIncorrectAnswerDialog(context);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeConstants.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
      ),
      child: Text(
        text,
        style: ThemeConstants.getButtonStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _showCorrectAnswerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: InputDesign(), // Affiche InputDesign pour une réponse correcte
        );
      },
    );
  }

  void _showIncorrectAnswerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: InputDesign2(), // Affiche InputDesign2 pour une réponse incorrecte
        );
      },
    );
  }
}
