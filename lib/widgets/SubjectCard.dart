import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/AppColors.dart';
import 'package:flutter_application_1/theme/AppTextStyles.dart';

class SubjectCard extends StatelessWidget {
  final String subjectId;
  final String title;
  final String imageUrl;
  final double? rating;
  final int? count;
  final TextEditingController controller;

  const SubjectCard({
    required this.subjectId,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.count,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            offset: const Offset(0, 10),
            blurRadius: 13,
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(7, 14, 7, 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              width: 144,
              height: 108,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 27),
          Text(
            title,
            style: AppTextStyles.subtitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary, width: 1),
            ),
            child: TextField(
              controller: controller, // ✅ هذا هو الأهم
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              style: AppTextStyles.label.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'ضع العلامة',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}