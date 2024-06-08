// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globel_edu/my_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name;
  String? phone;
  String? email;
  File? _image;
  late SharedPreferences? pref;

  @override
  void initState() {
    _loadFirestoreInformation();
    getInfo();
    _getImageFromLocalStorage();
    super.initState();
  }

  Future<void> _loadFirestoreInformation() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('User not logged in.');
      return;
    }

    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');

    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await userCollection.doc(user.email!).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      final userData = snapshot.data() as Map<String, dynamic>;

      if (snapshot.exists) {
        setState(() {
          name = userData['name'] ?? '';
          email = userData['email'] ?? '';
          phone = userData['phone'] ?? '';
        });
      } else {
        print('User data not found');
      }
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  Future<void> getInfo() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("name");
      phone = pref.getString("phone");
      email = pref.getString("email");
    });
  }

  Future<void> _getImageFromLocalStorage() async {
    final directory = await getApplicationDocumentsDirectory();
    final imageFile = File('${directory.path}/user.jpg');
    if (imageFile.existsSync()) {
      setState(() {
        _image = imageFile;
      });
    }
  }

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      final directory = await getApplicationDocumentsDirectory();
      final imageFile = File('${directory.path}/user.jpg');
      await imageFile.writeAsBytes(await _image!.readAsBytes());
    } else {
      print('No image selected.');
    }
  }

  // Future<void> clearData() async {
  //   var pref = await SharedPreferences.getInstance();
  //   pref.clear();
  // }

  // void signOut() {
  //   clearData();
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   auth.signOut().then((value) => Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (_) => const SplashScreen())));
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: getImage,
              child: CircleAvatar(
                backgroundColor: MyColors.appColor,
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? SizedBox(
                        width: 40,
                        child: Text(
                          "Tap to select Image",
                          style: TextStyle(fontSize: 12, color: MyColors.white),
                        ))
                    : null,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "$name",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 280,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: MyColors.black, width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Email: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "$email",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Phone: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "$phone",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
