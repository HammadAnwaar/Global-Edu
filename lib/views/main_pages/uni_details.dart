import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';
import 'package:global_edu/views/main_pages/video_page.dart';

class UniDetails extends StatefulWidget {
  const UniDetails({super.key});

  @override
  State<UniDetails> createState() => _UniDetailsState();
}

class _UniDetailsState extends State<UniDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Harvard University",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/app_logo.png",
                        fit: BoxFit.cover,
                      )),
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
                    "Scholarships are more than just monetary awards; they are investments in the future of talented and motivated individuals. They recognize and reward hard work, dedication, and potential, helping students achieve their educational and professional goals. By easing the financial burden, scholarships allow students to focus more on their studies, personal development, and community involvement."),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Programs.",
                  style: TextStyle(
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Text(
                    "Scholarship eligibility typically hinges on a combination of academic achievements, such as maintaining a specific GPA, and personal accomplishments, including leadership roles and community service. Applicants may also need to demonstrate financial need, submit recommendation letters, and write essays outlining their goals and qualifications."),
                const Text(
                  "Faculty.",
                  style: TextStyle(
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Text(
                    "Scholarship facilities often include tuition coverage, stipends for living expenses, access to mentorship programs, and opportunities for internships or study abroad experiences. Additionally, recipients may benefit from networking opportunities and career development workshops tailored to their fields of study."),
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
