import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
      required this.text,
      required this.sender,
      this.isImage = false});

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sender)
                      .text
                      .subtitle1(context)
                      .make()
                      .box
                      .color(sender == "You" ? Vx.red200 : Vx.green200)
                      .p16
                      .rounded
                      // .alignCenter
                      .alignment(sender == "You" ? Alignment.centerLeft:Alignment.centerRight)
                      .makeCentered(),
                  Expanded(
                    child: isImage
                        ? AspectRatio(
                            aspectRatio: 16/9,
                            child: Image.network(
                              text,
                              loadingBuilder: (context, child, loadingProgress) =>
                                  loadingProgress == null?child:
                                      const SimpleCircularProgressBar(
                                    progressColors: [Colors.blueGrey, Colors.blue, Colors.purpleAccent, Colors.purple],
                                    mergeMode: true,
                                  )
                            ),
                          )
                        : text.trim().text.bodyText1(context).make().px8(),
                  ),
                ],
              ).py8(),
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
        )
      ],
    );
  }
}
