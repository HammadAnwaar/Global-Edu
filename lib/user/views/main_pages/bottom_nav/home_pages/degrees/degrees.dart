import 'package:flutter/material.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/degrees/all_degrees.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/degrees/four_years.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/degrees/two_years.dart';

class Degrees extends StatefulWidget {
  const Degrees({super.key});

  @override
  State<Degrees> createState() => _DegreesState();
}

class _DegreesState extends State<Degrees> {
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
          "Degrees For you",
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
                  _buildTab('2 Years', 1, null),
                  _buildTab('4 years', 2, null),
                ],
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          AllDegrees(),
          TwoYearsDegree(),
          FourYearsDegree(),
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
