import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String uuid;
  final String message;
  final AnimationController animationController;

  const ChatMessage({
    super.key, required this.uuid, required this.message, required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.bounceInOut,
        ),

        child: Align(
          alignment:
              uuid == '123' ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: 10,
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            decoration: uuid == '123' ? _decotarationMy() : _decotarationHer(),
            child: Text(message),
          ),
        ),
      ),
    );
  }

  BoxDecoration _decotarationHer() {
    return const BoxDecoration(
      color:Color(0xffE4E5E8),
      borderRadius: BorderRadiusDirectional.only( topEnd: Radius.circular(30), bottomStart: Radius.circular(30), bottomEnd: Radius.circular(30))
    );
    
    
  }
  BoxDecoration _decotarationMy() {
    return const BoxDecoration(
      color:Color(0xff4D9EF6),
      borderRadius: BorderRadiusDirectional.only( topStart: Radius.circular(30), bottomStart: Radius.circular(30), bottomEnd: Radius.circular(30)),
    );
  }
}

class _TextContainer extends StatelessWidget {
  final TextAlign textAlign;
  const _TextContainer({this.textAlign = TextAlign.right});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hola como estas?',
      textAlign: textAlign,
    );
  }
}
