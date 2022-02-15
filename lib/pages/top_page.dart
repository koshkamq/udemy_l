import 'package:flutter/material.dart';
import 'package:flutter_chat/model/user.dart';
import 'package:flutter_chat/pages/talk_room.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<User> userList = [
    User(
      name: '田中',
      uid: 'abc',
      imagePath: 'https://cdn.tower.jp/za/o/7W/zaP2_G8383887W.JPG',
      lastMessage: 'こんにちわ',
    ),
    User(
      name: '小林',
      uid: 'def',
      imagePath:
          'https://storage.mantan-web.jp/images/2021/11/25/20211125dog00m200063000c/001_size6.jpg',
      lastMessage: 'ありがとう',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('チャットアプリ'),
        ),
        body: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TalkRoom(userList[index].name)));
                },
                child: Container(
                  height: 70,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(userList[index].imagePath),
                        ),
                      ),
                      Column(
                        //デフォルトはcenter
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userList[index].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'こんにちは',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
