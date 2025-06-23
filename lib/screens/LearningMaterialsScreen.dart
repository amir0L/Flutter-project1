import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'package:flutter_application_1/widgets/SubjectCard.dart';
import 'package:flutter_application_1/screens/InputDesignP7.dart';
import 'package:flutter_application_1/theme/AppColors.dart';
import 'package:flutter_application_1/theme/AppTextStyles.dart';
import 'package:http/http.dart' as http;

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

  List<Map<String, dynamic>> subjects = [
    {
      'id': 'Les mathématiques',
      'image': 'assets/math.jpg',
      'title': 'مادة الرياضيات',
      'rating': 4.8,
      'count': 20,
      'controller': TextEditingController(),
    },
    {
      'id': 'La langue arabe',
      'image': 'assets/arab.jpg',
      'title': 'مادة اللغة العربية',
      'rating': 4.8,
      'count': 20,
      'controller': TextEditingController(),
    },
    {
      'id': 'La langue française',
      'image': 'assets/faranch.jpg',
      'title': 'مادة الفرنسية',
      'rating': 4.8,
      'count': 20,
      'controller': TextEditingController(),
    },
    {
      'id': 'La langue anglaise',
      'image': 'assets/inglch.jpg',
      'title': 'مادة الانجليزية',
      'rating': 4.8,
      'count': 20,
      'controller': TextEditingController(),
    },
    {
      'id': 'Les sciences sociales',
      'image': 'assets/ijtma.png',
      'title': 'مادة الاجتماعيات',
      'rating': 4.8,
      'count': 20,
      'controller': TextEditingController(),
    },
    {
      'id': 'L\'éducation islamique',
      'image': 'assets/islam.png',
      'title': 'مادة التربية الاسلامية',
      'rating': 4.8,
      'count': 20,
      'controller': TextEditingController(),
    },
    {
      'id': 'L\'éducation civique',
      'image': 'assets/madani.jpg',
      'title': 'مادة التربية المدنية',
      'rating': 4.8,
      'count': 20,
      'controller': TextEditingController(),
    },
    {
      'id': 'Les sciences naturelles',
      'image': 'assets/sec.jpg',
      'title': 'مادة العلوم الطبعية',
      'rating': 4.8,
      'count': 20,
      'controller': TextEditingController(),
    },
    {
      'id': 'La physique',
      'image': 'assets/physics.jpg',
      'title': 'الفيزياء',
      'rating': 4.5,
      'count': 10,
      'controller': TextEditingController(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 467,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('رفيق التعلم', style: AppTextStyles.title),
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
                                  const Text('المولد التعلمية', style: AppTextStyles.title),
                                  const SizedBox(height: 20),
                                  _buildTextField(_nameController, ' الاسم  و اللقب '),
                                  const SizedBox(height: 15),
                                  _buildTextField(_classController, 'السنة التعليمية '),
                                  const SizedBox(height: 15),
                                  _buildTextField(_branchController, ' الثلاثي'),
                                  const SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 73),
                                      child: Text('تحليل نقاط المتحصل عليها', style: AppTextStyles.title),
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
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          const int userId = 123; // ✅ ضع هنا المعرف الصحيح للمستخدم
                          await sendLowNotesDirectly(
                            subjects: subjects,
                            nameController: _nameController,
                            classController: _classController,
                            branchController: _branchController,
                            userId: userId,
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
                      child: const Text('إبدأ', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w900)),
                    ),
                    const SizedBox(height: 63),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ReorderableWrap(
                        spacing: 12.0,
                        runSpacing: 12.0,
                        needsLongPressDraggable: true,
                        onReorder: (oldIndex, newIndex) {
                          setState(() {
                            final item = subjects.removeAt(oldIndex);
                            subjects.insert(newIndex, item);
                          });
                        },
                        children: subjects.map((subject) {
                          return SubjectCard(
                            key: ValueKey(subject['id']),
                            subjectId: subject['id'],
                            imageUrl: subject['image'],
                            title: subject['title'],
                            rating: subject['rating'],
                            count: subject['count'],
                            controller: subject['controller'],
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 86),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF336749),
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
        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
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

  Future<void> sendLowNotesDirectly({
    required List<Map<String, dynamic>> subjects,
    required TextEditingController nameController,
    required TextEditingController classController,
    required TextEditingController branchController,
    required int userId,
  }) async {
    final String apiUrl = 'https://quizapi-production-4b67.up.railway.app/api/v1/matieres';

    final String name = nameController.text;
    final int anneeScolaire = int.tryParse(classController.text) ?? 1;
    final int trimestre = int.tryParse(branchController.text) ?? 1;

    for (var subject in subjects) {
      final String text = subject['controller'].text;
      final double note = double.tryParse(text) ?? 0.0;

      if (note < 10.0) {
        final Map<String, dynamic> body = {
          "anneeScolaire": anneeScolaire,
          "trimestre": trimestre,
          "name": name,
          "noteExam": note,
          "noteDevoir1": 0.0,
          "noteDevoir2": 0.0,
          "userId": userId
        };

        try {
          final response = await http.post(
            Uri.parse(apiUrl),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(body),
          );

          if (response.statusCode == 200 || response.statusCode == 201) {
            print('✅ ${subject['id']} envoyé avec note: $note');
          } else {
            print('❌ Échec pour ${subject['id']}: ${response.body}');
          }
        } catch (e) {
          print('❗ Erreur lors de l’envoi de ${subject['id']}: $e');
        }
      }
    }
  }
}