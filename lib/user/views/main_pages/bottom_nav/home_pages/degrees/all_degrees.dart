import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:global_edu/constants/app_constants.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/degrees/degree_doc.dart';

class AllDegrees extends StatefulWidget {
  const AllDegrees({super.key});

  @override
  State<AllDegrees> createState() => _AllDegreesState();
}

class _AllDegreesState extends State<AllDegrees> {
  final String uniName = AppConstants.uniName;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String docName = AppConstants.subjName;

  Future<List<Map<String, dynamic>>> _fetchDegrees() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('degrees').get();

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
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _fetchDegrees(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            } else {
              List<Map<String, dynamic>> degrees = snapshot.data!;
              return ListView.builder(
                itemCount: degrees.length,
                itemBuilder: (context, index) {
                  String docId = degrees[index]['docId'];
                  Map<String, dynamic> data = degrees[index]['data'];
                  return GestureDetector(
                    onTap: () {
                      AppConstants.uniName =
                          data['title'] ?? 'Unknown University';
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DegreeDocPage(
                            docId: docId,
                            degreeLink: data['degreeLink'],
                          ),
                        ),
                      );
                    },
                    child: AppConstants.scholarshipContainer(
                      imagePath: data['image'].toString(),
                      title: data['title'] ?? 'Unknown Title',
                      subtitle: data['subtitle'] ?? 'Unknown Subtitle',
                      details: data['duration'] ?? 'Unknown Details',
                      actionText: "Apply Now",
                      score: data['score'] ?? 'N/A',
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
