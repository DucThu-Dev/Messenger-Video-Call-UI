import 'package:flutter/material.dart';

import 'package:flutter_messenger_video_call_ui/constant.dart';

class FunOptionMenuSideBar extends StatelessWidget {
  const FunOptionMenuSideBar({Key? key, required this.mode}) : super(key: key);

  final MessengerAnimationMode mode;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: draggableBottomSheetAnimateDuration,
      opacity: mode == MessengerAnimationMode.focus ? 1 : 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icons.face_rounded,
          Icons.emoji_emotions,
          Icons.bubble_chart,
          Icons.water_drop,
        ]
            .map(
              (icon) => Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
