import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class appUser{

  //attributes
  final String name ;
  final String email;
  final String password;
  final int phoneNumber;
  final String userRole;


  //constructor
  appUser(
      this.name ,
      this.email,
      this.phoneNumber,
      this.password,
      this.userRole
      );

  CollectionReference users = FirebaseFirestore.instance.collection('users');

//add users to the data base in firestore
   Future<void> addUser(){
    return users.add({
      'name' : name ,
      'email' : email,
      'phoneNumber' : phoneNumber,
      'password':password,
      'typeOfUser': userRole

    });
  }
}