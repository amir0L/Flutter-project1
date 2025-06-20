import 'package:flutter/material.dart';
//import '../widgets/EducationLevelCard.dart'; // Assurez-vous que ce fichier existe et est importé correctement.
import 'package:flutter_application_1/widgets/EducationLevelCard.dart';
import 'package:flutter_application_1/theme/AppTextStyles.dart'; // Assurez-vous que ce fichier est importé correctement.

class P5Screen extends StatelessWidget {
  const P5Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(80),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 501,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/wasate.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0, // Positionne le container en haut
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                                spreadRadius: 9,
                              ),
                            ],
                            border: const Border(
                              top: BorderSide(
                                color: Color(0x33000000),
                                width: 1,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(7, 11, 10, 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, //  Répartit les éléments
                            children: [
                              Image.asset(
                                'assets/Account.png',
                                height: 50,
                                width: 50,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 10), // Espacement
                              Expanded( //  Permet au texte de s'étendre au maximum
                                child: Align(
                                  alignment: Alignment.centerLeft, //  Aligner complètement à gauche
                                  child: Text(
                                    'رفيق التعلم',
                                    style: AppTextStyles.title,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 69,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            'السنوات التعلمية:',
                            style: TextStyle(
                              color: Color(0xFF4B5563),
                              fontSize: 32,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: SizedBox(
                    width: 363,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: EducationLevelCard(
                            imageUrl: 'assets/pri.jpg',
                            title: 'التعليم الابتدائي',
                          ),
                        ),
                        const SizedBox(width: 41),
                        Expanded(
                          child: EducationLevelCard(
                            imageUrl: 'assets/moy.jpg',
                            title: 'التعليم المتوسط',
                          ),
                        ),
                        const SizedBox(width: 41),
                        Expanded(
                          child: EducationLevelCard(
                            imageUrl: 'assets/sec.jpg',
                            title: 'التعليم الثانوي',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 162),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
