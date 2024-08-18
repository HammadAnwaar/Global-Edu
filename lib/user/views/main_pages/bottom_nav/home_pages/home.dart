import 'package:flutter/material.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/scholarships/scholarship.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/universities/universities.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/chat.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/degrees/degrees.dart';
import 'package:global_edu/user/views/main_pages/uni_details.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  late List<Home> hlist = [
    Home(
      name: 'Universities',
      img: 'assets/icons/university.png',
      page: const UniversitiesPage(),
    ),
    Home(
      name: 'Degrees',
      img: 'assets/icons/degrees.png',
      page: const Degrees(),
    ),
    Home(
      name: 'Budget Filter',
      img: 'assets/icons/budget_filter.png',
      page: const Scholarship(),
    ),
    Home(
      name: 'Chat',
      img: 'assets/icons/chat.png',
      page: const ChatPage(),
    ),
    Home(
      name: 'Ielts',
      img: 'assets/icons/ic_ielts.png',
      page: const UniDetails(),
    ),
    Home(
      name: 'Scholarship',
      img: 'assets/icons/scholarship.png',
      page: const Scholarship(),
    ),
  ];
  bool isTextEmpty = true;
  late List<Home> _filteredHlist;
  @override
  void initState() {
    super.initState();
    _filteredHlist = hlist;
    // searchController.addListener(() {
    //   setState(() {
    //     isTextEmpty = searchController.text.isEmpty;
    //   });
    // });
  }

  void _filterSearch(String query) {
    final List<Home> filteredList = hlist.where((item) {
      final String nameLower = item.name.toLowerCase();
      final String queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
    print(filteredList);

    setState(() {
      _filteredHlist = filteredList;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: TextFormField(
              cursorColor: MyColors.black,
              onChanged: (query) => _filterSearch(query),
              decoration: InputDecoration(
                  suffixIcon: isTextEmpty
                      ? const Icon(Icons.search)
                      : IconButton(
                          onPressed: () {
                            searchController.clear();
                          },
                          icon: const Icon(Icons.clear)),
                  hintText: "Search anything...",
                  fillColor: MyColors.backgroundColor,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12)))),
              controller: searchController,
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.9, // Adjust aspect ratio to fit your design
              ),
              itemCount: _filteredHlist.length, // Number of items in the grid
              itemBuilder: (BuildContext context, int index) {
                final item = _filteredHlist[index];
                return GestureDetector(
                  onTap: () async {
                    String link =
                        "https://youtube.com/playlist?list=PLfSUFKdFlttn1MWrG5Q0-a9Cbm9y3uulX&si=i-2o6sqOvfzgtQw7";
                    if (item.name == 'Ielts') {
                      if (await canLaunch(link)) {
                        await launch(link);
                      } else {
                        throw 'Could not launch $link';
                      }
                    }
                    // Add an optional else block if you want to handle clicks on other items
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.lightColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: MyColors.black, width: 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(item.img),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.name,
                          style: const TextStyle(
                            color: MyColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Home {
  String name;
  String img;
  dynamic page;
  Home({
    required this.name,
    required this.img,
    required this.page,
  });
}
