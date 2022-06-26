import 'package:cloud_firestore/cloud_firestore.dart';

class User1 {
  final String id;
  final String nickname;
  final String photoUrl;
  final String createdAt;

  User1({
    this.id,
    this.nickname,
    this.photoUrl,
    this.createdAt,
  });

  factory User1.fromDocument(DocumentSnapshot doc) {
    return User1(
      id: doc.id,
      photoUrl: doc['photoUrl'],
      nickname: doc['nickname'],
      createdAt: doc['createdAt'],

    );
  }
}