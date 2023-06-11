// import 'package:flutter/material.dart';
// import 'package:alan_voice/alan_voice.dart';

// class voiceChat extends StatefulWidget {
//   voiceChat({Key? key}) : super(key: key);

//   @override
//   _voiceChatState createState() => _voiceChatState();
// }

// class _voiceChatState extends State<voiceChat> {
//   _voiceChatState() {
//     _initAlanButton();
    
//   }

//   void _initAlanButton() {
//     AlanVoice.addButton(
//         "06d014b53c99bfc79e11b328e68824782e956eca572e1d8b807a3e2338fdd0dc/stage",
//         buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

//     AlanVoice.onCommand.add((command) {
//       debugPrint("got new command ${command.toString()}");
//       var commandName = command.data["command"] ?? "";
//       if (commandName == "showAlert") {
//         /// handle command "showAlert"
//       }
//     });

//     AlanVoice.onEvent.add((event) {
//       debugPrint("got new event ${event.data.toString()}");
//     });

//     AlanVoice.onButtonState.add((state) {
//       debugPrint("got new button state ${state.name}");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Voice assistance'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Hey',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
