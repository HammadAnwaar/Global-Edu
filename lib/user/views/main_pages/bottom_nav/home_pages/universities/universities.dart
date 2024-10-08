// ignore_for_file: avoid_print, unrelated_type_equality_checks, deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:global_edu/constants/app_constants.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/location.dart';

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({super.key});

  @override
  State<UniversitiesPage> createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: buildStartUp(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStartUp(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Feature Universities.",
        style: TextStyle(
          color: MyColors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: GestureDetector(
          onTap: () {
            AppConstants.subjName = "ComputerScience";
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Location()));
          },
          child: buildUniCard(
              context, "Diploma", "2:30", "4.0", "assets/images/computer.jpeg"),
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      const Text(
        "Programs.",
        style: TextStyle(
            color: MyColors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(
        height: 12,
      ),
      SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  AppConstants.subjName = "CS";
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Location()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: MyColors.backgroundColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: MyColors.black, width: 1),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset("assets/icons/ic_cs.png")),
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "CS",
                          style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  AppConstants.subjName = "Engineering";
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Location()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: MyColors.backgroundColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: MyColors.black, width: 1),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child:
                                      Image.asset("assets/icons/engineer.png")),
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Engineering",
                          style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  AppConstants.subjName = "Medical";
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Location()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: MyColors.backgroundColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: MyColors.black, width: 1),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child:
                                      Image.asset("assets/icons/medical.png")),
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Medical",
                          style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  AppConstants.subjName = "Arts";
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Location()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: MyColors.backgroundColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: MyColors.black, width: 1),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child:
                                      Image.asset("assets/icons/ic_arts.png")),
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Arts",
                          style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
      const SizedBox(
        height: 12,
      ),
      const Text(
        "My Progress.",
        style: TextStyle(
            color: MyColors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(
        height: 12,
      ),
      Container(
        margin: const EdgeInsets.only(right: 16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  "assets/images/computer.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Introduction to \nPsychology.",
                    style: TextStyle(
                        color: MyColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Michale",
                    style: TextStyle(color: MyColors.lblack, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "50% completed",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 60,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: MyColors.black, width: 1)),
                  child: const Icon(Icons.save_alt),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      SizedBox(
        width: double.infinity,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.appColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Adjust the value as needed
              ),
            ),
            onPressed: () {},
            child: const Text(
              "View All",
              style: TextStyle(color: MyColors.white),
            ),
          ),
        ),
      )
    ]);
  }

  Widget buildUniCard(BuildContext context, String title, String time,
      String rating, String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 60,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(18),
                              border:
                                  Border.all(color: MyColors.black, width: 1)),
                          child: const Icon(Icons.save_alt),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [const Icon(Icons.timer), Text(time)],
                          ),
                          Row(
                            children: [const Icon(Icons.star), Text(rating)],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(MyColors.appColor)),
                          onPressed: () {},
                          child: const Text(
                            "enroll now",
                            style: TextStyle(color: MyColors.white),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
