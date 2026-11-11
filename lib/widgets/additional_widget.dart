import 'package:flutter/material.dart';
import 'package:flutter_and_dart/constants/images.dart';

class AdditionalWidget extends StatelessWidget {
  const AdditionalWidget({super.key});

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
          // Первый элемент карточки
          Positioned(
            top: 5,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppImages.coffee,
                width: 61,
                height: 61,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 11,
            left: 75,
            child: Container(
              width: 90,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Просто кофе',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 11,
            left: 232,
            child: Container(
              width: 54,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                '200 руб',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Второй элемент карточки
          Positioned(
            top: 81,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppImages.coffee,
                width: 61,
                height: 61,
                fit: BoxFit.cover, // Заполняет квадрат без искажений
              ),
            ),
          ),
          Positioned(
            top: 86,
            left: 75,
            child: Container(
              width: 90,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Просто кофе',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 86,
            left: 232,
            child: Container(
              width: 54,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                '200 руб',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Третий эдемент карточки
          Positioned(
            top: 157,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppImages.coffee,
                width: 61,
                height: 61,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 161,
            left: 75,
            child: Container(
              width: 90,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Просто кофе',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 161,
            left: 232,
            child: Container(
              width: 54,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                '200 руб',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Четвертый эдемент карточки
          Positioned(
            top: 233,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppImages.coffee,
                width: 61,
                height: 61,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 236,
            left: 75,
            child: Container(
              width: 90,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Просто кофе',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 236,
            left: 232,
            child: Container(
              width: 54,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                '200 руб',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              AppImages.line,
              width: 44,
              height: 1,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
