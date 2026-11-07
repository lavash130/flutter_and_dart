// Главный экран приложения
import 'package:flutter/material.dart';
import 'package:flutter_and_dart/constants/mock.dart';
import 'package:flutter_and_dart/models/food.dart';
import 'package:flutter_and_dart/widgets/filter_card.dart';
import 'package:flutter_and_dart/widgets/food_card.dart';
import 'package:flutter_and_dart/widgets/panel.dart';
import 'package:flutter_and_dart/widgets/search_section.dart';
import 'package:flutter_and_dart/widgets/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Фильтр городов
class _HomePageState extends State<HomePage> {
  final List<String> _cities = const [
    'Челябинск',
    'Магнитогорск',
    'Копейск',
    'Миасс',
    'Коркино',
  ];

  String _selectedCity = 'Челябинск';
  bool _isOpen = false;
  bool _isMenuOpen = false;
  String _selectedCategory = 'Все';
  List<Food> filteredFood = foods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 370,
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),

                      // Панель с кнопками
                      Panel(
                        selectedCity: _selectedCity,
                        isCityDropdownOpen: _isOpen,
                        cities: _cities,
                        onMenuTap: () =>
                            setState(() => _isMenuOpen = !_isMenuOpen),
                        onCityTap: () => setState(() => _isOpen = !_isOpen),
                        onCitySelected: (city) {
                          setState(() {
                            _selectedCity = city;
                            _isOpen = false;
                          });
                        },
                      ),

                      const SizedBox(height: 69),

                      // Заголовок "Голоден" с поиском
                      const SearchSection(),

                      const SizedBox(height: 32),

                      // Фильтрация карточек с едой
                      FilterCard(
                        selectedCategory: _selectedCategory,
                        onCategorySelected: (category) {
                          if (category == 'Все') {
                            filteredFood = foods;
                          } else {
                            filteredFood = foods
                                .where((f) => f.category == category)
                                .toList();
                          }
                          setState(() => _selectedCategory = category);
                        },
                      ),

                      const SizedBox(height: 32),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredFood.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FoodCard(food: filteredFood[index]);
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),

                  // Бургер меню
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    top: 0,
                    bottom: 0,
                    left: _isMenuOpen ? 0 : -330,
                    child: SideMenu(
                      onClose: () => setState(() => _isMenuOpen = false),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
