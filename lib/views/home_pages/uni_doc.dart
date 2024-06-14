import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';

class UniDocPage extends StatefulWidget {
  const UniDocPage({super.key});

  @override
  State<UniDocPage> createState() => _UniDocPageState();
}

class _UniDocPageState extends State<UniDocPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                      "Apni University",
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
                        "assets/images/university.png",
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "University",
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
                const Text(
                    "Universities are more than just monetary awards; they are investments in the future of talented and motivated individuals. They recognize and reward hard work, dedication, and potential, helping students achieve their educational and professional goals. By easing the financial burden, Universitiess allow students to focus more on their studies, personal development, and community involvement."),
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
                const Text(
                    "Universities eligibility typically hinges on a combination of academic achievements, such as maintaining a specific GPA, and personal accomplishments, including leadership roles and community service. Applicants may also need to demonstrate financial need, submit recommendation letters, and write essays outlining their goals and qualifications."),
                const Text(
                  "Duration.",
                  style: TextStyle(
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Text(
                    "Universities durations can vary, typically covering one academic year, but many extend over multiple years or until the completion of a degree program. Renewal may require maintaining certain academic standards and fulfilling specific criteria set by the Universities provider."),
                const Text(
                  "Facilities.",
                  style: TextStyle(
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Text(
                    "Universities facilities often include tuition coverage, stipends for living expenses, access to mentorship programs, and opportunities for internships or study abroad experiences. Additionally, recipients may benefit from networking opportunities and career development workshops tailored to their fields of study."),
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
                          borderRadius: BorderRadius.circular(
                              12), // Adjust the value as needed
                        ),
                      ),
                      onPressed: () {},
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
        ),
      ),
    );
  }
}