// --------- P5 Widgets ---------
import 'package:flutter/material.dart';
import '../screens/LearningMaterialsScreen.dart'; // Assurez-vous que le bon chemin est utilisé

class EducationLevelCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const EducationLevelCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            offset: const Offset(0, 10),
            blurRadius: 13,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: 161,
            height: 128,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF336749),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 54),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Lorsque le bouton 'دخول' est pressé, naviguer vers la LearningMaterialsScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LearningMaterialsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF336749),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'دخول',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.3,
                          height: 1.7,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
