import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:global_edu/constants/app_constants.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/universities/uni_doc.dart';

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
                child: AppConstants.scholarshipContainer(
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
}
