import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';
import 'P3Screen.dart';  // Assurez-vous d'importer la page P3Screen

class P2Screen extends StatelessWidget {
  const P2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTopSection(),
              _buildBottomSection(context), // Pass context to _buildBottomSection
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/studye.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 25, // Position from the top of the container
            left: 10,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'التعلم',
                    style: AppTextStyles.titleArabic,
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    child: Text(
                      'رفيق',
                      style: AppTextStyles.titleArabic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25, // Position from the bottom of the container
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'لمحة تعريفية عن التطبيق',
                style: AppTextStyles.subtitleArabic.copyWith(
                  shadows: [
                    const Shadow(
                      color: Color(0xFFEDF2F4),
                      offset: Offset(0, 10),
                      blurRadius: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Container(
      width: 550,
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: const [
          BoxShadow(
            color: Color(0x3B000000),
            offset: Offset(-5, 13),
            blurRadius: 15,
            spreadRadius: 23,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'هو تطبيق ذكي يساعد الأولياء في توجه أبنائهم في الدراسة',
            style: AppTextStyles.descriptionArabic,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 61),
          Transform.translate(
            offset: const Offset(0, -20),
            child: GestureDetector(
              onTap: () {
                // Naviguer vers P3Screen lorsque le bouton "بدأ" est cliqué
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const P3Screen()),
                );
              },
              child: Container(
                constraints: const BoxConstraints(maxWidth: 236),
                height: 53,
                decoration: BoxDecoration(
                  color: AppColors.buttonGreen,
                  borderRadius: BorderRadius.circular(56),
                ),
                child: Center(
                  child: Text(
                    'بدأ',
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
