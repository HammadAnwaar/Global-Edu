// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/splash_screen.dart';
import 'package:global_edu/views/main_pages/edit_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? firstname;
  String? lastname;
  String? fullname;
  String? phone;
  String? email;
  String? nationality;
  String? gender;
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
          firstname = userData['firstName'] ?? '';
          lastname = userData['lastName'] ?? '';
          fullname = firstname! + lastname!;
          email = userData['email'] ?? '';
          phone = userData['phone'] ?? '';
          nationality = userData['nationality'] ?? '';
          gender = userData['gender'] ?? '';
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
      firstname = pref.getString('firstname');
      lastname = pref.getString('lastname');
      fullname = firstname! + lastname!;
      phone = pref.getString('phone');
      email = pref.getString('email');
      nationality = pref.getString('nationality');
      gender = pref.getString('gender');
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

  Future<void> clearData() async {
    var pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  void signOut() {
    clearData();
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut().then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const SplashScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(MyColors.black)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const EditProfile()));
                      },
                      child: Icon(
                        Icons.edit,
                        color: MyColors.white,
                      )),
                )),
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: getImage,
              child: CircleAvatar(
                backgroundColor: MyColors.appColor,
                radius: 60,
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
              "$fullname",
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
                            Row(
                              children: [
                                const Text(
                                  "Nationality: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "$nationality",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Gender: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "$gender",
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
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // Adjust the value as needed
                    ),
                  ),
                  onPressed: () {
                    signOut();
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(color: MyColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
