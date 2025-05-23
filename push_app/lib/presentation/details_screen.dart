import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/blocs/notifications/notifications_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
    
class DetailsScreen extends StatelessWidget {

  final String pushMessageId;
  const DetailsScreen({ super.key, required this.pushMessageId });
  
  @override
  Widget build(BuildContext context) {

    final PushMessage? message = context.watch<NotificationsBloc>().getMessageById(pushMessageId);

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: message != null ? _DetailsView(message: message,) : Text('no existe'),
    );
  }
}

class _DetailsView extends StatelessWidget {

  final PushMessage message;

  const _DetailsView({required this.message });

   @override
   Widget build(BuildContext context) {

        final textSyle = Theme.of(context).textTheme;
       return Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
       child: Column(
        children: [
            if(message.imageUrl != null) 
              Image.network(message.imageUrl!),
            const SizedBox(height: 30,),
            Text(message.title, style: textSyle.titleMedium,),
            Text(message.body),
            Divider(),
            Text(message.data.toString())

            
        ],
       ),);
  }
}