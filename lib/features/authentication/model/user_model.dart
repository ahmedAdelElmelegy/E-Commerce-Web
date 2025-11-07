import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/utils/formatters/formatter.dart';

class UserModel {
  String? id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String phoneNumber;
  String profilePicture;
  AppRole role;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.firstName = '',
    this.lastName = '',
    this.userName = '',
    required this.email,
    this.phoneNumber = '',
    this.profilePicture = '',
    this.role = AppRole.user,
    this.createdAt,
    this.updatedAt,
  });
  // helper method
  String get fullName => '$firstName $lastName';
  String get formatedDate => TFormatter.formatDate(createdAt);
  String get formatedUpdatAtDate => TFormatter.formatDate(updatedAt);
  String get formatedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);
  // empty user model
  static UserModel empty() => UserModel(email: '');
  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'role': role.name.toString(),
      'createdAt': createdAt,
      'updatedAt': updatedAt = DateTime.now(),
    };
  }

  // firestore document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data.containsKey('firstName') ? data['firstName'] ?? '' : '',
        lastName: data.containsKey('lastName') ? data['lastName'] ?? '' : '',
        userName: data.containsKey('userName') ? data['userName'] ?? '' : '',
        email: data.containsKey('email') ? data['email'] ?? '' : '',
        phoneNumber:
            data.containsKey('phoneNumber') ? data['phoneNumber'] ?? '' : '',
        profilePicture: data.containsKey('profilePicture')
            ? data['profilePicture'] ?? ''
            : '',
        role: data.containsKey('role')
            ? (data['role'] == AppRole.admin.name
                ? AppRole.admin
                : AppRole.user)
            : AppRole.user,
        createdAt: data.containsKey('createdAt')
            ? data['createdAt']?.toDate() ?? DateTime.now()
            : DateTime.now(),
        updatedAt: data.containsKey('updatedAt')
            ? data['updatedAt']?.toDate() ?? DateTime.now()
            : DateTime.now(),
      );
    } else {
      return empty();
    }
  }
}
