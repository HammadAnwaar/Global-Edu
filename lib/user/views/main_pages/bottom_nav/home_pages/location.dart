import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/universities/high_uni.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/universities/more_uni.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/universities/open_uni.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/universities/all_uni_list.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: MyColors.white,
            )),
        title: const Text(
          "Universities near you",
          style: TextStyle(color: MyColors.white),
        ),
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
                  _buildTab('Open', 1, null),
                  _buildTab('Highly', 2, null),
                  _buildTab('More', 3, null),
                ],
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          AllUniList(),
          OpenUni(),
          HighUni(),
          MoreUni(),
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
