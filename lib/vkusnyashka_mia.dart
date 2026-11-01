import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:flutter_and_dart/constants/images.dart';
import 'widgets/additional_widget.dart';
import 'widgets/similar_widget.dart';
import 'widgets/reviews_widget.dart';

class VkusnyashkaMiaPage extends StatefulWidget {
  const VkusnyashkaMiaPage({super.key});

  @override
  State<VkusnyashkaMiaPage> createState() => _VkusnyashkaMiaPageState();
}

class _VkusnyashkaMiaPageState extends State<VkusnyashkaMiaPage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 370,
            height: 1065,
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
            child: Stack(
              children: [
                // Изображение
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 370,
                    height: 286,
                    child: Image.asset(
                      AppImages.eatphoto3,
                      width: 370,
                      height: 286,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Кнопка "Назад"
                Positioned(
                  left: 45,
                  top: 60,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppImages.back,
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),

                // Корзина
                Positioned(
                  left: 300,
                  top: 60,
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      AppImages.cart2,
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),

                // Лайк
                Positioned(
                  left: 303,
                  top: 310,
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      AppImages.heart, 
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),

                // Текст
                Positioned(
                  left: 45,
                  top: 337,
                  child: Container(
                    width: 200,
                    height: 33,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Вкусняшка Миа',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
                Positioned(
                  left: 45,
                  top: 372,
                  child: SvgPicture.asset(
                    AppImages.star,
                    width: 14,
                    height: 14,
                  ),
                ),
                const Positioned(
                  left: 66,
                  top: 370,
                  child: Text(
                    '4,6',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Positioned(
                  left: 97,
                  top: 370,
                  child: Text(
                    '(100+)',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Positioned(
                  left: 153,
                  top: 370,
                  child: Container(
                    width: 75,
                    height: 19,
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '20-30 ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'мин'),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 276,
                  top: 347,
                  child: SizedBox(
                    width: 77,
                    height: 44,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Text('₽', style: TextStyle(fontSize: 14)),
                        ),
                        SizedBox(width: 2),
                        Text('350', style: TextStyle(fontSize: 32)),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 45,
                  top: 400,
                  child: Container(
                    width: 285,
                    height: 60,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Et consectetur commodo ut consectetur ex nulla voluptate commodo ipsum incididunt qui dolor. ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Кнопка "Купить"
                Positioned(
                  left: 45,
                  top: 475,
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
                
                // Кнопка "Дополнительно"
                Positioned(
                  left: 33,
                  top: 556,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                    },
                    child: Container(
                      width: 135,
                      height: 45,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Дополнительно',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),

                // Кнопка "Похожие"
                Positioned(
                  left: 168,
                  top: 556,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = 1;
                      });
                    },
                    child: Container(
                      width: 90,
                      height: 45,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Похожие',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),

                // Кнопка "Отзывы"
                Positioned(
                  left: 258,
                  top: 556,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = 2;
                      });
                    },
                    child: Container(
                      width: 90,
                      height: 45,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Отзывы',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),

                // Контейнер с вкладками
                Positioned(
                  left: (370 - 284) / 2,
                  top: 620,
                  child: _selectedTab == 0 
                      ? const AdditionalWidget() 
                      : _selectedTab == 1 
                          ? const SimilarWidget() 
                          : const ReviewsWidget(),
                ),
              ],      
            ),
          ),
        ),
      ),
    );
  }
}