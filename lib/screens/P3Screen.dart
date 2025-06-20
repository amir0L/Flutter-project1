import 'package:flutter/material.dart';
import 'P4Screen.dart';  // Importer la page ScannerScreen
import 'P5Screen.dart';  // Importer la page EducationLevelScreen

class P3Screen extends StatelessWidget {
  const P3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/Rectangle.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Container avec les images cliquables
                      Container(
                        padding: const EdgeInsets.fromLTRB(24, 32, 24, 51),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(139, 176, 181, 1),
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image cliquable 1
                            GestureDetector(
                              onTap: () {
                                // Naviguer vers la page P5Screen quand l'image est cliquée
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const P5Screen()),
                                );
                              },
                              child: Image.asset(
                                'assets/manuellw.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 46),
                            // Image cliquable 2
                            GestureDetector(
                              onTap: () {
                                // Naviguer vers la page P4Screen quand l'image est cliquée
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const P4Screen()),
                                );
                              },
                              child: Image.asset(
                                'assets/image9.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.fromLTRB(34, 10, 34, 22),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(139, 176, 181, 1),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Text(
                          'قم بمسح كشف النقاط الخاص بالفصل\nأو قم بإدخال النقاط يدويا',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'Island Moments',
                            fontSize: 28,
                            letterSpacing: -0.32,
                            height: 1.15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
