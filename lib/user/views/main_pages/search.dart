import 'package:flutter/material.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/universities/universities.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  bool isTextEmpty = true;
  final Map<String, bool> _isChecked = {
    'Finance': false,
    'Technology': false,
    'Health Sciences': false,
    'Arts': false,
  };

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        isTextEmpty = searchController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: TextFormField(
                cursorColor: MyColors.black,
                decoration: InputDecoration(
                  suffixIcon: isTextEmpty
                      ? const Icon(Icons.search)
                      : IconButton(
                          onPressed: () {
                            searchController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                  hintText: "Search Universities",
                  fillColor: MyColors.backgroundColor,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                controller: searchController,
              ),
            ),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              "Popular Programs.",
              style: TextStyle(
                color: MyColors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Business Administration",
                      style: TextStyle(fontSize: 14, color: MyColors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Computer Science",
                      style: TextStyle(fontSize: 14, color: MyColors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Engineering",
                      style: TextStyle(fontSize: 14, color: MyColors.black),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Psychology",
                      style: TextStyle(fontSize: 14, color: MyColors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Nursing",
                      style: TextStyle(fontSize: 14, color: MyColors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Education",
                      style: TextStyle(fontSize: 14, color: MyColors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Social Sciences",
                      style: TextStyle(fontSize: 14, color: MyColors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "Program Categories.",
              style: TextStyle(
                color: MyColors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ..._isChecked.keys.map((String key) {
              return CheckboxListTile(
                contentPadding: const EdgeInsets.all(0),
                activeColor: MyColors.backgroundColor,
                title: Text(
                  key,
                  style: const TextStyle(fontSize: 14),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: _isChecked[key],
                checkColor: MyColors.black,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked[key] = value ?? false;
                  });
                },
              );
            }),
            const SizedBox(
              height: 40,
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
                            builder: (_) => const UniversitiesPage()));
                  },
                  child: const Text(
                    "Find Universities",
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
