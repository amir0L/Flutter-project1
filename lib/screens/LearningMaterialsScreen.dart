import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/SubjectCard.dart';
import '../screens/InputDesignP7.dart';
import 'package:flutter_application_1/theme/AppColors.dart';
import 'package:flutter_application_1/theme/AppTextStyles.dart';
//                                                      P6
class LearningMaterialsScreen extends StatefulWidget {
  const LearningMaterialsScreen({Key? key}) : super(key: key);

  @override
  _LearningMaterialsScreenState createState() => _LearningMaterialsScreenState();
}

class _LearningMaterialsScreenState extends State<LearningMaterialsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Barre grise avec l'image et le texte
            Container(
              width: 467,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'رفيق التعلم',
                    style: AppTextStyles.title,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/Account.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            // Contenu principal
            Container(
              constraints: const BoxConstraints(maxWidth: 480),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/wasate.jpg',
                        width: double.infinity,
                        height: 485,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 100,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 29),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const Text(
                                  'المولد التعلمية',
                                  style: AppTextStyles.title,
                                ),
                                const SizedBox(height: 20),
                                _buildTextField(_nameController, 'الاسم '),
                                const SizedBox(height: 15),
                                _buildTextField(_classController, 'اللقب'),
                                const SizedBox(height: 15),
                                _buildTextField(_branchController, 'السنة التعليمية'),
                                const SizedBox(height: 30),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 73),
                                    child: Text(
                                      'تحليل نقاط المتحصل عليها',
                                      style: AppTextStyles.title,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Bouton "إبدأ"
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Nom: ${_nameController.text}");
                        print("Prem: ${_classController.text}");
                        print("Annee: ${_branchController.text}");

                        // Rediriger vers la page InputDesignP7
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const InputDesignP7()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'إبدأ',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  const SizedBox(height: 63),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Row(
                      children: [
                        Expanded(
                          child: SubjectCard(
                            subjectId: 'الرياضيات',
                            imageUrl: 'assets/math.jpg',
                            title: 'مادة الرياضيات',
                            rating: 4.8,
                            count: 20,
                          ),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          child: SubjectCard(
                            subjectId: 'الفيزياء',
                            imageUrl: 'assets/physics.jpg',
                            title: 'الفيزياء',
                            rating: 4.5,
                            count: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 86),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour créer un champ de saisie avec la couleur corrigée
  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      width: 180, // Taille ajustée pour être plus petite
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF336749), // Nouvelle couleur verte
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white, // Texte en blanc pour contraste
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white60, fontSize: 13),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'يرجى ملء هذا الحقل';
          }
          return null;
        },
      ),
    );
  }
}
