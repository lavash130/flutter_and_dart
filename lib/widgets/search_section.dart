import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_and_dart/constants/images.dart';


class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        // Заголовок «Голоден?»
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 47),
            child: Container(
              width: 270,
              height: 49,
              alignment: Alignment.centerLeft,
              child: const Text('Голоден?', style: TextStyle(fontSize: 36)),
            ),
          ),
        ),
        const SizedBox(height: 32),
        
        // Поиск
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Container(
              width: 195,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 6,
                    child: SvgPicture.asset(AppImages.search, width: 18, height: 18),
                  ),
                  const Positioned(
                    left: 37,
                    top: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Поиск по меню',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}