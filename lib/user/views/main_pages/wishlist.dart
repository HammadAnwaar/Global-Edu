import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:global_edu/app_constants.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/user/views/main_pages/video_page.dart';

class WishListPage extends StatefulWidget {
  // final String docId;
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String docName = AppConstants.subjName;

  Future<Map<String, dynamic>> _fetchUniversityData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection('universities')
          .doc('uni_types')
          .collection(docName)
          .doc("widget.docId")
          .get();
      return docSnapshot.data() as Map<String, dynamic>;
    } catch (e) {
      print('Error fetching data: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.blue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: MyColors.white,
            ),
          ),
          title: const Text(
            "widget.docId",
            style: TextStyle(
                color: MyColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: _fetchUniversityData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            } else {
              Map<String, dynamic> data = snapshot.data!;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                child: ListView(
                  children: [
                    const Text(
                      "University",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: MyColors.red),
                    ),
                    const Text(
                      "Program",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: MyColors.blue),
                    ),
                    const SizedBox(height: 20),
                    Align(
                        alignment: Alignment.center,
                        child: Card(
                          elevation: 8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              data['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/images/university.png",
                                  fit: BoxFit.fill,
                                );
                              },
                            ),
                          ),
                        )),
                    const SizedBox(height: 20),
                    const Text(
                      "Introduction.",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(data['introduction'] ?? 'N/A'),
                    const SizedBox(height: 12),
                    const Text(
                      "Requirements.",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(data['requirements'] ?? 'N/A'),
                    const SizedBox(height: 12),
                    const Text(
                      "Duration.",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(data['duration'] ?? 'N/A'),
                    const SizedBox(height: 12),
                    const Text(
                      "Facilities.",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(data['facilities'] ?? 'N/A'),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoScreen(
                                          url: data['video'],
                                          uniLink: data['uniLink'],
                                        )));
                          },
                          child: const Text(
                            "Apply Now",
                            style: TextStyle(color: MyColors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
