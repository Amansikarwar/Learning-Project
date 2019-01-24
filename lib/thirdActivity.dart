import 'package:flutter/material.dart';

class ThirdActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat App"),
          elevation: 10,
        ),
        body: ChatScreen());
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _tController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmited(String text) {
    _tController.clear();

    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.greenAccent),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _tController,
                onSubmitted: _handleSubmited,
                decoration:
                    InputDecoration.collapsed(hintText: "Type the message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmited(_tController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(
          height: 2,
        ),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _textComposerWidget(),
        ),
      ],
    );
  }
}

final String _name = "Aman";

class ChatMessage extends StatelessWidget {
  final String text;

  ChatMessage({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(_name[0]),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(text),
              ),
              Text(_name, style: Theme.of(context).textTheme.subhead),
            ],
          ),
        ],
      ),
    );
  }
}
