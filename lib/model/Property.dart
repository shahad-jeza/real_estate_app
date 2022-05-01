import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class Property{
  late  double _price ;
  late  double _space ;
  late String _location;
  late int _numberOfBedRooms;
  late int _numberOfBathRooms;
  late int _numberOfLivingRooms;
  late String _typeOfProperty;

  Property(){
    this._price;
    this._space;
    this._location;
    this._numberOfBedRooms;
    this._numberOfBathRooms;
    this._numberOfLivingRooms;
    this._typeOfProperty;
  }

  CollectionReference properties = FirebaseFirestore.instance.collection('properties');

  Future<void> addProperty(){
    return properties.add({
      'typeOfProperty' : _typeOfProperty,
      'numberOfBedRooms' : _numberOfBedRooms ,
      'numberOfBathRooms' : _numberOfBathRooms ,
      'numberOfLivingRooms' : _numberOfLivingRooms ,
      'price' : _price,
      'space' : _space,
      'location':_location

    });

  }
  void deleteProperty(){}
  void editProperty(){}
  void viewProperty(){}
  void search(String searchInput){}
}