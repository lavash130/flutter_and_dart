import 'package:flutter/material.dart';
import 'package:flutter_and_dart/models/food.dart';
import 'package:flutter_and_dart/screens/detail_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_and_dart/constants/images.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 286,
      child: Stack(
        children: [
          // Изображение
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              food.imagePath,
              width: 370,
              height: 165,
              fit: BoxFit.cover,
            ),
          ),

          // Название
          Positioned(
            left: 45,
            top: 181,
            child: Container(
              width: 108,
              height: 19,
              alignment: Alignment.centerLeft,
              child: Text(
                food.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Звезда
          Positioned(
            left: 45,
            top: 202,
            child: SvgPicture.asset(AppImages.star, width: 14, height: 14),
          ),

          // Рейтинг
          Positioned(
            left: 66,
            top: 200,
            child: Text(
              food.rating,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          // Отзывы
          const Positioned(
            left: 97,
            top: 200,
            child: Text(
              '(100+)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),

          // Время приготовления
          Positioned(
            left: 153,
            top: 200,
            child: Container(
              width: 75,
              height: 19,
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '${food.time} ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: 'мин'),
                  ],
                ),
              ),
            ),
          ),

          // Стоимость
          Positioned(
            left: 263,
            top: 177,
            child: SizedBox(
              width: 77,
              height: 44,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text('₽', style: TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(width: 2),
                  Text(food.price, style: const TextStyle(fontSize: 32)),
                ],
              ),
            ),
          ),

          // Кнопка "Купить"
          Positioned(
            left: 45,
            top: 241,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(food: food)),
              ),
              child: Container(
                width: 285,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Купить',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
