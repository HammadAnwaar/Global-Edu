import 'package:flutter/material.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/scholarships/high_price.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/scholarships/scholar_list.dart';

import 'low_price.dart';

class Scholarship extends StatefulWidget {
  const Scholarship({super.key});

  @override
  State<Scholarship> createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.blue,
        title: const Text(
          "Scholarships For you",
          style: TextStyle(color: MyColors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: MyColors.white,
            )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab('All', 0, null),
                  _buildTab('low price', 1, null),
                  _buildTab('High price', 2, null),
                ],
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          ScholarList(),
          LowPrice(),
          HighPrice(),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index, Icon? icon) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : MyColors.backgroundColor,
          border: Border.all(
            color: isSelected ? MyColors.white : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              icon,
              const SizedBox(
                  width:
                      4), // Optional: Add some space between the icon and text
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected ? MyColors.white : MyColors.blue,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String text, int index) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
