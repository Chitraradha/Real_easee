import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class TypeofpropertyCategory extends ChangeNotifier{
  gettypeproperty()async{
 CollectionReference property = FirebaseFirestore.instance.collection("SELLPOST");
 List category=[];
  QuerySnapshot query=await property.get();
  for(var doc in query.docs){
    var feildValue=doc.get('typeofproperty');
    category.add(feildValue);
    print('$feildValue');
    notifyListeners();
  }
  return category;
  }
  
}