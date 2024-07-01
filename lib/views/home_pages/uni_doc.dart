import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:global_edu/app_constants.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/views/main_pages/video_page.dart';

class UniDocPage extends StatefulWidget {
  final String docId;
  const UniDocPage({super.key, required this.docId});

  @override
  State<UniDocPage> createState() => _UniDocPageState();
}

class _UniDocPageState extends State<UniDocPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String docName = AppConstants.subjName;

  Future<Map<String, dynamic>> _fetchUniversityData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection('universities')
          .doc('uni_types')
          .collection(docName)
          .doc(widget.docId)
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
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: ListView(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          "${widget.docId} University",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                          "assets/images/university.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
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
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: MyColors.blue),
                    ),
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
