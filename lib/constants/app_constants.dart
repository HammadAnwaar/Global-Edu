import 'package:flutter/material.dart';
import 'package:global_edu/constants/my_colors.dart';

class AppConstants {
  static String subjName = "";
  static String uniName = "";

    static scholarshipContainer({
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
          Expanded(
            child: Row(
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
                Expanded(
                  child: Column(
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
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: MyColors.black,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        details,
                        style: const TextStyle(
                          color: MyColors.black,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        actionText,
                        style: const TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
              style: const TextStyle(
                color: MyColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
