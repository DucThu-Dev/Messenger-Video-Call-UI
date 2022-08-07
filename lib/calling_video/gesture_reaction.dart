part of './calling_page.dart';

class GestureReaction extends StatelessWidget {
  const GestureReaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final messengerAnimationMode =
            context.read<CallingState>().messengerAnimationMode;
        if (messengerAnimationMode == MessengerAnimationMode.hide) {
          showBottomSheetAsCollapseMode(context);
        } else if (messengerAnimationMode == MessengerAnimationMode.focus) {
          hideBottomSheet(context);
        }
      },
    );
  }

  void hideBottomSheet(BuildContext context) {
    animateControllerSize(context, kDraggableZeroHeightFraction);
  }

  void showBottomSheetAsCollapseMode(BuildContext context) {
    animateControllerSize(context, kDraggableMinHeightFraction);
  }

  void showBottomSheetAsExpandMode(BuildContext context) {
    animateControllerSize(context, kDraggableMaxHeightFraction);
  }

  void animateControllerSize(BuildContext context, double size) {
    context.read<CallingState>().draggableScrollableController.animateTo(size,
        duration: draggableBottomSheetAnimateDuration,
        curve: draggableBottomSheetCurve);
  }
}
