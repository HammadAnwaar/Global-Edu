import 'package:flutter/material.dart';
import 'package:global_edu/my_colors.dart';

class RefinePage extends StatefulWidget {
  const RefinePage({super.key});

  @override
  State<RefinePage> createState() => _RefinePageState();
}

class _RefinePageState extends State<RefinePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildScholarshipContainer(
          imagePath: "assets/images/app_logo.png",
          title: "Future Leaders",
          subtitle: "STEM Scholarship",
          details: "500 Scholarships",
          actionText: "Apply Now",
          score: "9.5A",
        ),
        _buildScholarshipContainer(
          imagePath: "assets/images/app_logo.png",
          title: "Bright Minds",
          subtitle: "Arts Scholarship",
          details: "300 Scholarships",
          actionText: "Apply Now",
          score: "8.7B",
        ),
        _buildScholarshipContainer(
          imagePath: "assets/images/app_logo.png",
          title: "Tech Innovators",
          subtitle: "IT Scholarship",
          details: "200 Scholarships",
          actionText: "Apply Now",
          score: "9.2A",
        ),
      ],
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
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
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
