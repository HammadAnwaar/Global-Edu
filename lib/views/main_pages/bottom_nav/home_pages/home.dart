// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/views/main_pages/bottom_nav/home_pages/location.dart';
import 'package:global_edu/views/main_pages/bottom_nav/home_pages/scholarships/scholarship.dart';
import 'package:global_edu/views/main_pages/bottom_nav/home_pages/universities/universities.dart';
import 'package:global_edu/views/main_pages/bottom_nav/chat.dart';
import 'package:global_edu/views/main_pages/bottom_nav/home_pages/degrees/degrees.dart';
import 'package:global_edu/views/main_pages/uni_details.dart';

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
      name: 'Programs',
      img: 'assets/icons/programs.png',
      page: const ChatPage(),
    ),
    Home(
      name: 'Location',
      img: 'assets/icons/location.png',
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => item.page,
                      ),
                    );
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Column(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (_) => const UniversitiesPage()));
          //           },
          //           child: Container(
          //             height: 180,
          //             width: MediaQuery.of(context).size.width / 2.5,
          //             decoration: BoxDecoration(
          //                 color: MyColors.lightColor,
          //                 borderRadius: BorderRadius.circular(16)),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Container(
          //                     decoration: BoxDecoration(
          //                         border: Border.all(
          //                             color: MyColors.black, width: 1),
          //                         borderRadius: BorderRadius.circular(16)),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child: Image.asset(
          //                           "assets/icons/university.png"),
          //                     )),
          //                 const SizedBox(
          //                   height: 4,
          //                 ),
          //                 const Text(
          //                   "Universities",
          //                   style: TextStyle(
          //                       color: MyColors.black,
          //                       fontWeight: FontWeight.w500),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),

          //         const SizedBox(
          //           height: 22,
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (_) => const VideoScreen()));
          //           },
          //           child: Container(
          //             height: 180,
          //             width: MediaQuery.of(context).size.width / 2.5,
          //             decoration: BoxDecoration(
          //                 color: MyColors.lightColor,
          //                 borderRadius: BorderRadius.circular(16)),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Container(
          //                     decoration: BoxDecoration(
          //                         border: Border.all(
          //                             color: MyColors.black, width: 1),
          //                         borderRadius: BorderRadius.circular(16)),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child: Image.asset(
          //                           "assets/icons/budget_filter.png"),
          //                     )),
          //                 const SizedBox(
          //                   height: 4,
          //                 ),
          //                 const Text(
          //                   "Budget Filter",
          //                   style: TextStyle(
          //                       color: MyColors.black,
          //                       fontWeight: FontWeight.w500),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 22,
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (_) => const Location()));
          //           },
          //           child: Container(
          //             height: 180,
          //             width: MediaQuery.of(context).size.width / 2.5,
          //             decoration: BoxDecoration(
          //                 color: MyColors.lightColor,
          //                 borderRadius: BorderRadius.circular(16)),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Container(
          //                     decoration: BoxDecoration(
          //                         border: Border.all(
          //                             color: MyColors.black, width: 1),
          //                         borderRadius: BorderRadius.circular(16)),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child:
          //                           Image.asset("assets/icons/location.png"),
          //                     )),
          //                 const SizedBox(
          //                   height: 4,
          //                 ),
          //                 const Text(
          //                   "Location",
          //                   style: TextStyle(
          //                       color: MyColors.black,
          //                       fontWeight: FontWeight.w500),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (_) => const ChatPage()));
          //           },
          //           child: Container(
          //             height: 180,
          //             width: MediaQuery.of(context).size.width / 2.5,
          //             decoration: BoxDecoration(
          //                 color: MyColors.lightColor,
          //                 borderRadius: BorderRadius.circular(16)),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Container(
          //                     decoration: BoxDecoration(
          //                         border: Border.all(
          //                             color: MyColors.black, width: 1),
          //                         borderRadius: BorderRadius.circular(16)),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child:
          //                           Image.asset("assets/icons/degrees.png"),
          //                     )),
          //                 const SizedBox(
          //                   height: 4,
          //                 ),
          //                 const Text(
          //                   "Degrees",
          //                   style: TextStyle(
          //                       color: MyColors.black,
          //                       fontWeight: FontWeight.w500),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 22,
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (_) => const UniDetails()));
          //           },
          //           child: Container(
          //             height: 180,
          //             width: MediaQuery.of(context).size.width / 2.5,
          //             decoration: BoxDecoration(
          //                 color: MyColors.lightColor,
          //                 borderRadius: BorderRadius.circular(16)),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Container(
          //                     decoration: BoxDecoration(
          //                         border: Border.all(
          //                             color: MyColors.black, width: 1),
          //                         borderRadius: BorderRadius.circular(16)),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child:
          //                           Image.asset("assets/icons/programs.png"),
          //                     )),
          //                 const SizedBox(
          //                   height: 4,
          //                 ),
          //                 const Text(
          //                   "Programs",
          //                   style: TextStyle(
          //                       color: MyColors.black,
          //                       fontWeight: FontWeight.w500),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 22,
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (_) => const Location()));
          //           },
          //           child: Container(
          //             height: 180,
          //             width: MediaQuery.of(context).size.width / 2.5,
          //             decoration: BoxDecoration(
          //                 color: MyColors.lightColor,
          //                 borderRadius: BorderRadius.circular(16)),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Container(
          //                     decoration: BoxDecoration(
          //                         border: Border.all(
          //                             color: MyColors.black, width: 1),
          //                         borderRadius: BorderRadius.circular(16)),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child: Image.asset(
          //                           "assets/icons/scholarship.png"),
          //                     )),
          //                 const SizedBox(
          //                   height: 4,
          //                 ),
          //                 const Text(
          //                   "Scholarships",
          //                   style: TextStyle(
          //                       color: MyColors.black,
          //                       fontWeight: FontWeight.w500),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
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
