import 'package:flutter/material.dart';

import 'package:flutter_messenger_video_call_ui/calling_video/calling_state.dart';
import 'package:flutter_messenger_video_call_ui/calling_video/common_menu.dart';
import 'package:flutter_messenger_video_call_ui/constant.dart';
import 'package:flutter_messenger_video_call_ui/data.dart';
import 'package:provider/provider.dart';

part './draggable_menu_sheet.dart';
part './gesture_reaction.dart';

class CallingPage extends StatelessWidget {
  const CallingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => CallingState(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: const CallingPageView(),
          ),
        ),
      ),
    );
  }
}

class CallingPageView extends StatelessWidget {
  const CallingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CallingState>(
      builder: (context, state, child) {
        return Stack(
          children: [
            Positioned.fill(
              child: CallingView(
                messengerAnimationMode: state.messengerAnimationMode,
              ),
            ),
            Positioned(
              left: 8,
              top: 0,
              bottom: 0,
              child: FunOptionMenuSideBar(
                mode: state.messengerAnimationMode,
              ),
            ),
            const Positioned.fill(
              child: MenuBottomModal(),
            ),
            const Positioned.fill(
              child: GestureReaction(),
            ),
            AnimatedPositioned(
              duration: draggableBottomSheetAnimateDuration,
              curve: draggableBottomSheetCurve,
              top: state.messengerAnimationMode == MessengerAnimationMode.focus
                  ? 12
                  : 0.0,
              left: 12,
              child: AnimatedOpacity(
                opacity:
                    state.messengerAnimationMode == MessengerAnimationMode.focus
                        ? 1.0
                        : 0.0,
                duration: draggableBottomSheetAnimateDuration,
                curve: draggableBottomSheetCurve,
                child: const BackButton(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CallingView extends StatefulWidget {
  const CallingView({
    Key? key,
    required this.messengerAnimationMode,
  }) : super(key: key);

  final MessengerAnimationMode messengerAnimationMode;

  @override
  State<CallingView> createState() => _CallingViewState();
}

class _CallingViewState extends State<CallingView> {
  final _members = members;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CallingView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.messengerAnimationMode != widget.messengerAnimationMode) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (widget.messengerAnimationMode == MessengerAnimationMode.expand) {
      child = CallingViewDraggableBottomSheetExpand(
        callMembers: _members,
        messengerAnimationMode: widget.messengerAnimationMode,
      );
    } else {
      child = CallingViewDraggableBottomSheetFocus(
        callMembers: _members,
        messengerAnimationMode: widget.messengerAnimationMode,
      );
    }

    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        alignment: Alignment.topCenter,
        child: child,
      ),
    );
  }
}

class CallingViewDraggableBottomSheetFocus extends StatelessWidget {
  const CallingViewDraggableBottomSheetFocus({
    Key? key,
    required this.callMembers,
    required this.messengerAnimationMode,
  }) : super(key: key);

  final List<CallMember> callMembers;

  final MessengerAnimationMode messengerAnimationMode;

  /// Because I lazy to handle logic, and it also out of scope of my target.
  /// => Get this hardcode.
  CallMember get firstMem => callMembers.first;

  /// Because I lazy to handle logic, and it also out of scope of my target.
  /// => Get this hardcode.
  CallMember get secondMem => callMembers.last;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage(firstMem.videoSource),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: draggableBottomSheetAnimateDuration,
          curve: draggableBottomSheetCurve,
          top: messengerAnimationMode == MessengerAnimationMode.focus ? 24 : 12,
          right: 12,
          child: TinyMeVideoView(
            me: secondMem,
          ),
        ),
      ],
    );
  }
}

class CallingViewDraggableBottomSheetExpand extends StatelessWidget {
  const CallingViewDraggableBottomSheetExpand(
      {Key? key,
      required this.callMembers,
      required this.messengerAnimationMode})
      : super(key: key);

  final List<CallMember> callMembers;
  final MessengerAnimationMode messengerAnimationMode;

  @override
  Widget build(BuildContext context) {
    final blocHeight =
        MediaQuery.of(context).size.height * (1 - kDraggableMaxHeightFraction);
    return SizedBox(
      height: blocHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: callMembers
              .map((member) => TinyMeVideoView(
                    me: member,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

/// Floating view indicate the user owner video.
class TinyMeVideoView extends StatelessWidget {
  const TinyMeVideoView({Key? key, required this.me}) : super(key: key);

  final CallMember me;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kTinyMeVideoCallViewHeight,
      width: kTinyMeVideoCallViewWidth,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius12,
        image: DecorationImage(
          image: NetworkImage(me.videoSource),
          fit: BoxFit.cover,
        ),
        color: Colors.blueGrey,
      ),
    );
  }
}
