// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/user/views/dashboard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef OnImageChanged = void Function(File imageFile);

class EditProfile extends StatefulWidget {
  const EditProfile({
    super.key,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;
  TextEditingController fnController = TextEditingController();
  TextEditingController lnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  late SharedPreferences pref;

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
      // widget.onImageChanged(_image!);
    } else {
      print('No image selected.');
    }
  }

  @override
  void initState() {
    super.initState();
    _getImageFromLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.white,
          title: const Text(
            "Profile",
            style: TextStyle(
                color: MyColors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(MyColors.backgroundColor)),
                  onPressed: () {
                    fnController.text = "";
                    lnController.text = "";
                    phoneController.text = "";
                    nationalController.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "cancel",
                    style: TextStyle(color: MyColors.black),
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(child: Container()),
              Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: getImage,
                    child: CircleAvatar(
                      backgroundColor: MyColors.black,
                      radius: 60,
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? const SizedBox(
                              width: 40,
                              child: Text(
                                "Tap to select Image",
                                style: TextStyle(
                                    fontSize: 12, color: MyColors.white),
                              ))
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Change profile image",
                    style: TextStyle(
                        color: MyColors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "First Name",
                          style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          height: 70,
                          width: width / 1.4,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            obscureText: false,
                            cursorColor: MyColors.black,
                            controller: fnController,
                            style: const TextStyle(
                              color: MyColors.black,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              counterText: '',
                              fillColor: MyColors.backgroundColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              // hintText: "FirstName...",
                              hintStyle: TextStyle(color: MyColors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Text(
                          "Last Name",
                          style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          height: 70,
                          width: width / 1.4,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            obscureText: false,
                            cursorColor: MyColors.black,
                            controller: lnController,
                            style: const TextStyle(
                              color: MyColors.black,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              counterText: '',
                              fillColor: MyColors.backgroundColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              // hintText: "LastName...",
                              hintStyle: TextStyle(color: MyColors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Text(
                          "Phone",
                          style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: width / 1.4,
                          height: 70,
                          child: TextFormField(
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            cursorColor: MyColors.black,
                            controller: phoneController,
                            style: const TextStyle(
                              color: MyColors.black,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              counterText: '',
                              fillColor: MyColors.backgroundColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              // hintText: "Phone...",
                              hintStyle: TextStyle(color: MyColors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length == 1) {
                                return 'Please Enter your Phone Number';
                              }
                              if (value.length != 11) {
                                return 'Phone number must be 11 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Nationality",
                          style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: width / 1.4,
                          height: 70,
                          child: TextFormField(
                            obscureText: false,
                            cursorColor: MyColors.black,
                            controller: nationalController,
                            style: const TextStyle(
                              color: MyColors.black,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              counterText: '',
                              fillColor: MyColors.backgroundColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              // hintText: "Nationality...",
                              hintStyle: TextStyle(color: MyColors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: MyColors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length == 1) {
                                return 'Please Enter your Nationality';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(MyColors.black)),
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                _saveDataFireStore();
                                addDataInPref();
                              }
                            },
                            child: const Text("Save changes",
                                style: TextStyle(
                                    color: MyColors.white,
                                    fontWeight: FontWeight.bold)))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveDataFireStore() async {
    final user = FirebaseAuth.instance.currentUser;
    String? userEmail = user!.email;
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    try {
      await userCollection.doc(userEmail).update({
        'firstName': fnController.text,
        'lastName': lnController.text,
        'phone': phoneController.text,
        'nationality': nationalController.text,
      });
      fnController.text = '';
      lnController.text = '';
      phoneController.text = '';
      nationalController.text = '';
      Fluttertoast.showToast(
        msg: 'Data Save Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.white,
        textColor: MyColors.black,
        fontSize: 16.0,
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Dashboard()),
        (Route<dynamic> route) => false,
      );
      print('User information and contacts updated successfully.');
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.white,
        textColor: MyColors.black,
        fontSize: 16.0,
      );
      print('Error updating user information and contacts: $e');
    }
  }

  Future<void> addDataInPref() async {
    pref = await SharedPreferences.getInstance();
    pref.setString('firstName', fnController.text);
    pref.setString('lastName', lnController.text);
    pref.setString('phone', phoneController.text);
    pref.setString('nationality', nationalController.text);
  }
}
