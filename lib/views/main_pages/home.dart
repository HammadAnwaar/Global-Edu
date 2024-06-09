import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/views/home_pages/universities.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  bool isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        isTextEmpty = searchController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: TextFormField(
                cursorColor: MyColors.black,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const UniversitiesPage()));
                      },
                      child: Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            color: MyColors.lightColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColors.black, width: 1),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                      "assets/icons/university.png"),
                                )),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Universities",
                              style: TextStyle(
                                  color: MyColors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: MyColors.lightColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyColors.black, width: 1),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                    "assets/icons/budget_filter.png"),
                              )),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Budget Filter",
                            style: TextStyle(
                                color: MyColors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: MyColors.lightColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyColors.black, width: 1),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset("assets/icons/location.png"),
                              )),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(
                                color: MyColors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: MyColors.lightColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyColors.black, width: 1),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset("assets/icons/degrees.png"),
                              )),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Degrees",
                            style: TextStyle(
                                color: MyColors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: MyColors.lightColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyColors.black, width: 1),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset("assets/icons/programs.png"),
                              )),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Programs",
                            style: TextStyle(
                                color: MyColors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: MyColors.lightColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyColors.black, width: 1),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/scholarship.png"),
                              )),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Scholarships",
                            style: TextStyle(
                                color: MyColors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
