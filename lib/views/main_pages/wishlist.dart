import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/views/main_pages/video_page.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> _fetchUniversityData() async {
    return await _firestore
        .collection('scholarships')
        .doc('apnischolarship')
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
          future: _fetchUniversityData(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text("Error fetching data"));
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text("No data available"));
            }

            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          "Apni Scholarship",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: MyColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            "assets/icons/gradu_hat.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Scholarship",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: MyColors.red),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Program",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: MyColors.blue),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Introduction.",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(data['introduction']),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Requirements.",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(data['requirements']),
                    const Text(
                      "Duration.",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(data['duration']),
                    const Text(
                      "Facilities.",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(data['facilities']),
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
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const VideoScreen()));
                          },
                          child: const Text(
                            "Apply Now",
                            style: TextStyle(color: MyColors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
