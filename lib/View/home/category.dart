import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  List<dynamic> filteredPosts = []; // To store the filtered posts
  List<dynamic> allPosts = []; // To store all posts

  @override
  void initState() {
    super.initState();
    fetchAllPosts(); // Fetch all posts on initialization
  }

  Future<void> fetchAllPosts() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('POST').get();
      allPosts = querySnapshot.docs.map((doc) => doc.data()).toList();
      setState(() {}); // Update the state to refresh the UI
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  Future<void> fetchSelectedCategory(String category) async {
    // Filter posts based on the selected category
    setState(() {
      filteredPosts = allPosts.where((post) {
        return post['typeofproperty'] == category;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('POST').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error occurred'));
          }

          final categoryList = snapshot.data!.docs;
          Set<String> list = {};
          for (var doc in categoryList) {
            list.add(doc.get('typeofproperty'));
          }

          List<String> categoryListType = list.toList();

          return SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryListType.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    var selectedCategory = categoryListType[index];
                    print(selectedCategory);
                    fetchSelectedCategory(selectedCategory);
                  },
                  child: Container(
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        categoryListType[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
