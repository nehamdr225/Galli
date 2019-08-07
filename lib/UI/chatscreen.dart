import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

const String _name = "Neha";

class ChatScreenState extends StatefulWidget {
  @override
  _ChatScreenStateState createState() => _ChatScreenStateState();
}

class _ChatScreenStateState extends State<ChatScreenState>
    with TickerProviderStateMixin {

  final TextEditingController _textController = TextEditingController();
  final List<ChatMessages> _messages= <ChatMessages>[];

  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessages message = ChatMessages(
      text: text,
      animationController: AnimationController(
        vsync: this,
        duration: Duration(microseconds: 800)
      ),
    );

    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  void dispose(){
    for(ChatMessages message in _messages){
      message.animationController.dispose();
    }
    super.dispose();
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.greenAccent[200]
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Send a message"
                ),
                controller: _textController,
                // onChanged: (String text){
                //   setState(() {
                //     _isWriting = text.length> 0;
                //   });
                //},
                onSubmitted: _handleSubmitted,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child:Theme.of(context).platform ==TargetPlatform.iOS
            ? CupertinoButton(
              child: Text("Submit"),
              onPressed:()=> _handleSubmitted(_textController.text)
            )
            :IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),  
          ]
        ),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
        ? BoxDecoration(
          border: Border( top: BorderSide(color: Colors.brown))
        ):null
      ),
    );

  }
  //_textComposerWidget();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}

class ChatMessages extends StatelessWidget {
  final String text;
  final AnimationController animationController;
  ChatMessages({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(sizeFactor: CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut
    ),
    axisAlignment: 0.0,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(_name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_name, style: Theme.of(context).textTheme.subhead,),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ],
      ),
    ),
  );
    
    
  }
}