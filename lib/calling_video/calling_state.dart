import 'package:flutter/cupertino.dart';

import 'package:flutter_messenger_video_call_ui/constant.dart';

class CallingState with ChangeNotifier {
  CallingState() {
    draggableScrollableController.addListener(listenToDraggableController);
  }

  final DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  MessengerAnimationMode messengerAnimationMode = MessengerAnimationMode.focus;

  void listenToDraggableController() {
    if (draggableScrollableController.size <= 0.001) {
      updateState(MessengerAnimationMode.hide);
    } else if (draggableScrollableController.size >=
            kDraggableMinHeightFraction - 0.001 &&
        draggableScrollableController.size <=
            kDraggableMinHeightFraction + 0.001) {
      updateState(MessengerAnimationMode.focus);
    } else if (draggableScrollableController.size >=
            kDraggableMaxHeightFraction - 0.001 &&
        draggableScrollableController.size <=
            kDraggableMaxHeightFraction + 0.001) {
      updateState(MessengerAnimationMode.expand);
    }
  }

  void updateState(MessengerAnimationMode mode) {
    if (messengerAnimationMode == mode) return;
    messengerAnimationMode = mode;
    notifyListeners();
  }
}
