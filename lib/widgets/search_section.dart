import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_and_dart/constants/images.dart';

class SearchSection extends StatelessWidget {
  final Function(String) onSearch; 

  const SearchSection({super.key, required this.onSearch});

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
              child: TextField(
                onChanged: onSearch, 
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Поиск по меню',
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                  border: InputBorder.none, 
                  isDense: true, 
                  contentPadding: const EdgeInsets.only(top: 7, bottom: 7), 
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 8, top: 2),
                    child: SvgPicture.asset(
                      AppImages.search, 
                      width: 18, 
                      height: 18,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 36, 
                    minHeight: 36,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}