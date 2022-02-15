import 'package:flutter/material.dart';
import 'package:flutter_chat/model/message.dart';
import 'package:intl/intl.dart' as intl;

class TalkRoom extends StatefulWidget {
  final String name;
  TalkRoom(this.name);

  @override
  _TalkRoomState createState() => _TalkRoomState();
}

class _TalkRoomState extends State<TalkRoom> {
  List<Message> messageList = [
    Message(
        message: 'あいうえお', isMe: true, sendTime: DateTime(2022, 2, 3, 15, 57)),
    Message(
        message: 'かきくけこああああああああああああああああああああああああああああああああああああああああああ',
        isMe: false,
        sendTime: DateTime(2022, 2, 3, 16, 45)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView.builder(
                //要素が画面幅以上になればスクロールできるようになる
                physics: RangeMaintainingScrollPhysics(),
                //中身は上から表示（要素の分だけlist作る）
                shrinkWrap: true,
                //スクロールは上側に
                reverse: true,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 10.0,
                        right: 10,
                        left: 10,
                        bottom: index == 0 ? 10 : 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      //rowウィジェットの中身を左右どちらから始めるか
                      textDirection: messageList[index].isMe
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Container(
                            //メッセージの最大の幅を指定
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            decoration: BoxDecoration(
                              color: messageList[index].isMe
                                  ? Colors.green
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(messageList[index].message)),
                        Text(
                          intl.DateFormat('HH:mm')
                              .format(messageList[index].sendTime),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  TextField(),
                  //IconButton(onPressed: , icon: icon)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
