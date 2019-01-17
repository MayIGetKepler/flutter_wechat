import 'package:flutter/material.dart';

class Contact {
  final String avatar;
  final String name;
  final String nameIndex;
  const Contact(
      {@required this.avatar, @required this.name, this.nameIndex});

  bool isAvatarFromNet() {
    return this.avatar.toLowerCase().startsWith('http');
  }
}

class ContactPageData {
  List<Contact> contacts;

  ContactPageData(this.contacts);

  static ContactPageData mock() {
    return ContactPageData(mockContacts);
  }
}

 List<Contact> mockContacts = [
   Contact(
     avatar: 'https://randomuser.me/api/portraits/women/43.jpg',
     name: 'Anjali',
     nameIndex: 'A'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
     name: 'Heidi',
     nameIndex: "H"
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/women/21.jpg',
     name: 'Freddie',
     nameIndex: 'F'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/85.jpg',
     name: 'Laura',
     nameIndex: 'L'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/34.jpg',
     name: 'Buster',
     nameIndex: 'B'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/28.jpg',
     name: 'Lamar',
     nameIndex: 'L'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
     name: 'Santos',
     nameIndex: 'S'
   ),
   Contact(
     avatar:'https://randomuser.me/api/portraits/men/57.jpg' ,
     name: 'Verlie',
     nameIndex: 'V'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/51.jpg',
     name: 'Triston',
     nameIndex: 'T'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/15.jpg',
     name: 'Malachi',
     nameIndex: 'M'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/women/70.jpg',
     name: 'Gerardo',
     nameIndex: 'G'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/women/82.jpg',
     name: 'Ezra',
     nameIndex: 'E'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/women/87.jpg',
     name: 'Emerald',
     nameIndex: 'E'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/61.jpg',
     name: 'Naomie',
     nameIndex: 'N'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/women/12.jpg',
     name: 'Elbert',
     nameIndex: 'E'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/3.jpg',
     name: 'Colby',
     nameIndex: 'C'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/24.jpg',
     name: 'Delmer',
     nameIndex: 'D'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/42.jpg',
     name: 'Richie',
     nameIndex: 'R'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/women/50.jpg',
     name: 'Kaylin',
     nameIndex: 'K'
   ),
   Contact(
     avatar: 'https://randomuser.me/api/portraits/men/41.jpg',
     name: 'Orland',
     nameIndex: 'O'
   ),
];
