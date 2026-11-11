import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_and_dart/constants/images.dart';

class SideMenu extends StatelessWidget {
  final VoidCallback onClose;

  const SideMenu({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 330,
      height: 812, 
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 237, 235, 235),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
            offset: Offset(1, 0),
          ),
        ],
      ),
      child: Stack(
        children: [
          
          // Аватар
          Positioned(
            top: 60,
            left: 45,
            child: Image.asset(
              AppImages.avatar,
              width: 45,
              height: 45,
            ),
          ),

          // Имя пользователя
          Positioned(
            top: 65,
            left: 105,
            child: Container(
              width: 100,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Juanita Nguyen',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Email пользователя
          Positioned(
            top: 80,
            left: 105,
            child: Container(
              width: 127,
              height: 19,
              alignment: Alignment.centerLeft,
              child: const Text(
                'somemail@mail.com',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),

          // Кнопка закрытия
          Positioned(
            top: 69,
            left: 255,
            child: GestureDetector(
              onTap: onClose,
              child: SvgPicture.asset(
                AppImages.exit,
                width: 30,
                height: 30,
              ),
            ),
          ),

          // Пункт меню 1
          Positioned(
            top: 135,
            left: 45,
            child: Container(
              width: 285,
              height: 45,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Все меню',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          // Пункт меню 2
          Positioned(
            top: 180,
            left: 45,
            child: Container(
              width: 285,
              height: 45,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Заказы',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          // Пункт меню 3
          Positioned(
            top: 225,
            left: 45,
            child: Container(
              width: 285,
              height: 45,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Корзина',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}