import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real__ease/model/postmodel.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('POST').snapshots(),
        builder: ( context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          if(snapshot.hasError){
            return const Center(child: Text('Error occured'),);
          }

          final categorylist = snapshot.data!.docs;
          Set list = {};
          for(var doc in categorylist){
                list.add(doc.get('typeofproperty'));
            
          }
          
          List categorylisttype = list.toList();
          return  SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorylisttype.length,
                  itemBuilder: (context, index) {
                   
                    return GestureDetector(
                      onTap: (){
                        var selectedCategory = categorylisttype[index];
                        print(categorylisttype[index]);
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
                           categorylisttype[index]
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
        }
       
      ),
    );
  }

  Future fetchSelectedCategory(var category)async {
  
    List post = [];
   
try{
  QuerySnapshot querySnapshot =await FirebaseFirestore.instance.collection('POST').get();
    print(querySnapshot.docs.length);
    for(var doc in querySnapshot.docs){
      post.add(doc.data());
    }
    print(post);
    print('[[[[[[[[[[[[]]]]]]]]]]]]');
    print(post.length);
    filterCategory(post,category);
}catch(e){
  print('Error');
}
  }


  Future filterCategory(post,category)async{
    List filterList = [];
      if(post != null){
        for(var doc in post){
          print(doc['typeofproperty']);
           if(doc['typeofproperty'] == category){

            filterList.add(doc);
        }
        }
       
      }
      
      print('[[[[[[[[[[[[[[[[[[777777]]]]]]]]]]]]]]]]]]');
      print(filterList.length);
      print(filterList);
      print('[[[[[[[[[[[[[[[[[[88888]]]]]]]]]]]]]]]]]]');
  }

}