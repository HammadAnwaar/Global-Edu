import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:global_edu/app_constants.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/views/main_pages/bottom_nav/home_pages/universities/uni_doc.dart';

class MoreUni extends StatefulWidget {
  const MoreUni({super.key});

  @override
  State<MoreUni> createState() => _MoreUniState();
}

class _MoreUniState extends State<MoreUni> {
  final String uniName = AppConstants.uniName;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String docName = AppConstants.subjName;

  Future<List<Map<String, dynamic>>> _fetchUniversities() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('universities')
          .doc('uni_types')
          .collection(docName)
          .where('details', isGreaterThan: '200')
          .get();

      return querySnapshot.docs.map((doc) {
        return {
          'docId': doc.id,
          'data': doc.data(),
        };
      }).toList();
    } catch (e) {
      print('Error fetching universities: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchUniversities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data found'));
        } else {
          List<Map<String, dynamic>> universities = snapshot.data!;
          return ListView.builder(
            itemCount: universities.length,
            itemBuilder: (context, index) {
              String docId = universities[index]['docId'];
              Map<String, dynamic> data = universities[index]['data'];
              return GestureDetector(
                onTap: () {
                  AppConstants.uniName = data['title'] ?? 'Unknown University';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UniDocPage(docId: docId),
                    ),
                  );
                },
                child: _buildScholarshipContainer(
                  imagePath: data['image'].toString(),
                  title: data['title'] ?? 'Unknown Title',
                  subtitle: data['subtitle'] ?? 'Unknown Subtitle',
                  details: data['details'] ?? 'Unknown Details',
                  actionText: "Apply Now",
                  score: data['score'] ?? 'N/A',
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildScholarshipContainer({
    required String imagePath,
    required String title,
    required String subtitle,
    required String details,
    required String actionText,
    required String score,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.backgroundColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: imagePath.isNotEmpty
                      ? Image.network(
                          imagePath,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/university.png",
                              fit: BoxFit.fill,
                            );
                          },
                        )
                      : Image.asset(
                          "assets/images/university.png",
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: MyColors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    details,
                    style: const TextStyle(
                      color: MyColors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    actionText,
                    style: const TextStyle(
                      color: MyColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: MyColors.lightColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              score,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
