import 'package:flutter/material.dart';
import 'package:flutter_and_dart/constants/images.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284,
      height: 295,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          
          // Полоска дял отображения открытой влкадки
          Positioned(
            top: 0,
            left: 213,
            child: Image.asset(
              AppImages.line,
              width: 44,
              height: 1, 
              fit: BoxFit.cover, 
            ),
          ),

          // Уведомляющий текст
          const Center(
            child: Text(
              'В разработке',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}