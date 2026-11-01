import 'package:flutter/material.dart';
import 'package:flutter_and_dart/constants/images.dart';
import 'widgets/side_menu.dart';
import 'widgets/panel.dart';
import 'widgets/search_section.dart';
import 'widgets/filter_card.dart';
import 'widgets/food_card.dart';
import 'derzkay_margo.dart';
import 'gorachy_paren.dart';
import 'vkusnyashka_mia.dart';
import 'sitiy_pitt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Моё приложение',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// Главный экран приложения
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Фильтр городов
class _HomePageState extends State<HomePage> {
  final List<String> _cities = const ['Челябинск', 'Магнитогорск', 'Копейск', 'Миасс', 'Коркино'];
  
  String _selectedCity = 'Челябинск';
  bool _isOpen = false;
  bool _isMenuOpen = false;
  String _selectedCategory = 'Все';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 370,
            height: 1680,
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 12, offset: const Offset(0, 4)),
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
                        onMenuTap: () => setState(() => _isMenuOpen = !_isMenuOpen),
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
                          setState(() => _selectedCategory = category);
                        },
                      ),

                      const SizedBox(height: 32),

                      // Карточки меню
                      if (_selectedCategory == 'Все' || _selectedCategory == 'Пицца') ...[
                        FoodCard(
                          imagePath: AppImages.pizza1,
                          title: 'Дерзкая марго',
                          rating: '4,6',
                          time: '25-30',
                          price: '300',
                          onBuyTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DerzkayMargoPage()));
                          },
                        ),
                        const SizedBox(height: 20),
                      ],

                      if (_selectedCategory == 'Все' || _selectedCategory == 'Кебаб') ...[
                        FoodCard(
                          imagePath: AppImages.eatphoto2,
                          title: 'Горячий парень',
                          rating: '4,5',
                          time: '15-30',
                          price: '325',
                          onBuyTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const GorachyParenPage()));
                          }, // 
                        ),
                        const SizedBox(height: 20),
                      ],

                      if (_selectedCategory == 'Все') ...[
                        FoodCard(
                          imagePath: AppImages.eatphoto3,
                          title: 'Вкусняшка Миа',
                          rating: '4,5',
                          time: '20-30',
                          price: '350',
                          onBuyTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const VkusnyashkaMiaPage()));
                          }, // 
                        ),
                        const SizedBox(height: 20),
                      ],

                      if (_selectedCategory == 'Все' || _selectedCategory == 'Бургер') ...[
                        FoodCard(
                          imagePath: AppImages.eatphoto4,
                          title: 'Сытый Питт',
                          rating: '4,7',
                          time: '10-15',
                          price: '140',
                          onBuyTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SitiyPittPage()));
                          }, 
                        ),
                        const SizedBox(height: 20),
                      ],
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