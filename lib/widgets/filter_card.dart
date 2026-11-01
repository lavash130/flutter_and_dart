import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const FilterCard({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  // Шаблон для кнопок фильтра
  Widget _buildButton({
    required double left,
    required String image,
    required String title,
  }) {
    bool isSelected = selectedCategory == title;
    return Positioned(
      left: left,
      top: 0,
      child: GestureDetector(
        onTap: () => onCategorySelected(title),
        child: SizedBox(
          width: 45,
          height: 75,
          child: Stack(
            children: [
              Positioned(
                left: 4.5,
                top: 5.25,
                child: Image.asset(image, width: 36, height: 34.95, fit: BoxFit.contain),
              ),
              Positioned(
                left: 1.5,
                top: 56,
                child: SizedBox(
                  width: 45,
                  height: 19,
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 285,
      height: 75,
      child: Stack(
        children: [
          _buildButton(left: 0, image: 'assets/images/buttionmenu1.jpg', title: 'Все'), // Замените на AppImages, если нужно
          _buildButton(left: 80, image: 'assets/images/buttionmenu2.jpg', title: 'Пицца'),
          _buildButton(left: 160, image: 'assets/images/buttionmenu3.jpg', title: 'Кебаб'),
          _buildButton(left: 240, image: 'assets/images/buttionmenu4.jpg', title: 'Бургер'),
        ],
      ),
    );
  }
}