import 'package:flutter/material.dart';
/*                                  P3 && P5                           */
class ClickableImageCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final double leftMargin;

  const ClickableImageCard({
    Key? key,
    required this.imageUrl,
    required this.text,
    this.leftMargin = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: leftMargin),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(27),
              child: SizedBox( // ✅ Fixe la taille des images
                width: 120,  // Largeur uniforme
                height: 250, // Hauteur uniforme
                child: Image.asset( // ⚠️ Changement ici : Image.asset pour images locales
                  imageUrl,
                  fit: BoxFit.cover, // ✅ Pour remplir la boîte
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
