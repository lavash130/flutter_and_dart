import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_and_dart/constants/images.dart';

// Классы для элементов панели
class Panel extends StatelessWidget {
  final String selectedCity;
  final bool isCityDropdownOpen;
  final VoidCallback onMenuTap;
  final VoidCallback onCityTap;
  final Function(String) onCitySelected;
  final List<String> cities;

  const Panel({
    super.key,
    required this.selectedCity,
    required this.isCityDropdownOpen,
    required this.onMenuTap,
    required this.onCityTap,
    required this.onCitySelected,
    required this.cities,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 34,
      color: Colors.white,
      child: Stack(
        clipBehavior: Clip.none, 
        children: [
          
          // Бургер меню
          Positioned(
            left: 45,
            top: 2,
            child: GestureDetector(
              onTap: onMenuTap,
              child: SvgPicture.asset(AppImages.menu, width: 30, height: 30),
            ),
          ),
          
          // Фильтр по городам
          Positioned(
            left: 90,
            top: 2,
            child: GestureDetector(
              onTap: onCityTap,
              child: Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 4,
                      child: Container(
                        width: 83,
                        height: 22,
                        alignment: Alignment.center,
                        child: Text(
                          selectedCity,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 104,
                      top: 8,
                      child: Icon(
                        isCityDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Кнопка корзина
          Positioned(
            left: 300,
            top: 2,
            child: SvgPicture.asset(AppImages.cart, width: 30, height: 30),
          ),
          
          // Список городов при нажатии на фильтр
          if (isCityDropdownOpen)
            Positioned(
              left: 90,
              top: 38,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: cities.map((city) {
                      return InkWell(
                        onTap: () => onCitySelected(city),
                        child: Container(
                          width: 120,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Text(city, style: const TextStyle(fontSize: 14)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}