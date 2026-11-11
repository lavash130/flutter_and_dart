import 'package:flutter/material.dart';
import 'package:flutter_and_dart/constants/images.dart';

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
                left: 0,
                right: 0,
                top: 56,
                child: SizedBox(
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
          _buildButton(left: 0, image: AppImages.buttonmenu1, title: 'Все'),
          _buildButton(left: 80, image: AppImages.buttonmenu2, title: 'Пицца'),
          _buildButton(left: 160, image: AppImages.buttonmenu3, title: 'Кебаб'),
          _buildButton(left: 240, image: AppImages.buttonmenu4, title: 'Бургер'),
        ],
      ),
    );
  }
}