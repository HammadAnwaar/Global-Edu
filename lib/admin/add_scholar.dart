// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_edu/auth_textfield.dart';
import 'package:global_edu/my_button.dart';
import 'package:global_edu/my_colors.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddScholarships extends StatefulWidget {
  const AddScholarships({super.key});

  @override
  State<AddScholarships> createState() => _AddScholarshipsState();
}

class _AddScholarshipsState extends State<AddScholarships> {
  SharedPreferences? pref;
  String? userType;
  TextEditingController titleController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController requirementsController = TextEditingController();
  TextEditingController facilitiesController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController introductionController = TextEditingController();
  TextEditingController scoreController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController scholarshipLinkController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  int? subject;
  int? score;
  String? docName;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.white,
          appBar: AppBar(
            backgroundColor: MyColors.appColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: MyColors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              "Add Scholarships Here.",
              style: TextStyle(color: MyColors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  AuthTextField(
                    obsecureText: false,
                    hintText: "Scholarship Name...",
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter scholarship name";
                      } else if (value.contains(RegExp("r[0-9]"))) {
                        return "name only contains Alphabets";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    hintText: "Subtitle...",
                    obsecureText: false,
                    controller: subtitleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Uni subtitle.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    hintText: "Introduction...",
                    obsecureText: false,
                    controller: introductionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Uni Intro";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * 1,
                    child: AuthTextField(
                      hintText: "Duration...",
                      obsecureText: false,
                      controller: durationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter scholarship Duration.";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    hintText: "Facilities...",
                    obsecureText: false,
                    controller: facilitiesController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Uni Facilities.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    hintText: "Details...",
                    obsecureText: false,
                    controller: detailsController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Uni Details.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    hintText: "Requirements...",
                    obsecureText: false,
                    controller: requirementsController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Uni Requirements.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth * .4,
                          child: MultiSelectDropDown<int>(
                            borderRadius: 12,
                            hint: "Give Score.",
                            hintFontSize: 22,
                            hintColor: MyColors.black,
                            borderColor: MyColors.black,
                            borderWidth: 1,
                            fieldBackgroundColor: MyColors.lightColor,
                            selectedOptionBackgroundColor:
                                MyColors.backgroundColor,
                            onOptionSelected:
                                (List<ValueItem> selectedOptions) {
                              if (selectedOptions.isNotEmpty) {
                                score = selectedOptions.first.value;
                                print(subject);
                              }
                            },
                            options: const [
                              ValueItem(label: '1', value: 1),
                              ValueItem(label: '1.5', value: 2),
                              ValueItem(label: '2', value: 3),
                              ValueItem(label: '2.5', value: 4),
                              ValueItem(label: '3', value: 5),
                              ValueItem(label: '3.5', value: 6),
                              ValueItem(label: '4', value: 7),
                              ValueItem(label: '4.5', value: 8),
                              ValueItem(label: '5', value: 9),
                            ],
                            dropdownHeight: screenHeight * 0.3,
                            selectionType: SelectionType.single,
                            chipConfig:
                                const ChipConfig(wrapType: WrapType.wrap),
                            optionTextStyle: const TextStyle(
                                fontSize: 16, color: MyColors.black),
                            selectedOptionIcon: const Icon(Icons.check_circle,
                                color: MyColors.black),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: screenWidth * .4,
                          child: AuthTextField(
                            hintText: "Fees...",
                            obsecureText: false,
                            controller: feesController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Uni Fees.";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    hintText: "paste image url...",
                    obsecureText: false,
                    controller: imageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter image url.";
                      } else if (!imageController.text.contains("http")) {
                        return "Please enter valid url.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    hintText: "paste scholarship url...",
                    obsecureText: false,
                    controller: scholarshipLinkController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter uni url.";
                      } else if (!imageController.text.contains("http")) {
                        return "Please enter valid url.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 20),
                      child: GestureDetector(
                        child: const MyButton(
                          text: 'Save',
                        ),
                        onTap: () async {
                          if (globalKey.currentState!.validate()) {
                            try {
                              _saveDataFireStore();
                              Fluttertoast.showToast(
                                msg: 'Data saved successfully',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: MyColors.backgroundColor,
                                textColor: MyColors.black,
                                fontSize: 16.0,
                              );
                            } catch (e) {
                              Fluttertoast.showToast(
                                msg: 'Error: $e',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: MyColors.backgroundColor,
                                textColor: MyColors.black,
                                fontSize: 16.0,
                              );
                            }
                          }
                        },
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> _saveDataFireStore() async {
    String? rating;
    if (score == 1) {
      rating = "1";
    } else if (score == 2) {
      rating = "1.5";
    } else if (score == 3) {
      rating = "2";
    } else if (score == 4) {
      rating = "2.5";
    } else if (score == 5) {
      rating = "3";
    } else if (score == 6) {
      rating = "3.5";
    } else if (score == 7) {
      rating = "4";
    } else if (score == 8) {
      rating = "4.5";
    } else if (score == 9) {
      rating = "5";
    }

    print('clickValue: $subject');

    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('scholarships');

    try {
      await userCollection.doc(titleController.text).set({
        'title': titleController.text,
        'image': imageController.text,
        'fees': feesController.text,
        'details': detailsController.text,
        'duration': durationController.text,
        'facilities': facilitiesController.text,
        'introduction': introductionController.text,
        'requirements': requirementsController.text,
        'subtitle': subtitleController.text,
        'score': rating,
        'scholarshipLink': scholarshipLinkController.text,
      });
      print('User information and contacts saved successfully.');
      titleController.clear();
      imageController.clear();
      feesController.clear();
      detailsController.clear();
      durationController.clear();
      facilitiesController.clear();
      introductionController.clear();
      requirementsController.clear();
      subtitleController.clear();
      scholarshipLinkController.clear();
    } catch (e) {
      print('Error saving user information and contacts: $e');
    }
  }
}
