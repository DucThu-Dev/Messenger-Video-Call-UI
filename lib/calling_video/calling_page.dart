import 'package:flutter/material.dart';

import 'package:flutter_messenger_video_call_ui/constant.dart';
import 'package:flutter_messenger_video_call_ui/data.dart';

part './draggable_menu_sheet.dart';

class CallingPage extends StatefulWidget {
  const CallingPage({Key? key}) : super(key: key);

  @override
  State<CallingPage> createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Stack(
            children: [
              Positioned.fill(
                  child: CallingView(
                controller: _draggableScrollableController,
              )),
              Positioned.fill(
                child: MenuBottomModal(
                  controller: _draggableScrollableController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CallingView extends StatefulWidget {
  const CallingView({Key? key, required this.controller}) : super(key: key);

  final DraggableScrollableController controller;

  @override
  State<CallingView> createState() => _CallingViewState();
}

class _CallingViewState extends State<CallingView> {
  bool _expandVideoCall = true;

  final _members = members;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.size == kDraggableMaxHeightFraction) {
        setState(() {
          _expandVideoCall = false;
        });
      } else {
        setState(() {
          _expandVideoCall = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (_expandVideoCall) {
      child = CallingViewExpand(
        callMembers: _members,
      );
    } else {
      child = CallingViewCollaped(
        callMembers: _members,
      );
    }

    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(color: Colors.amber),
        alignment: Alignment.topCenter,
        child: child,
      ),
    );
  }
}

class CallingViewExpand extends StatelessWidget {
  const CallingViewExpand({Key? key, required this.callMembers})
      : super(key: key);

  final List<CallMember> callMembers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.cyan,
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: TinyMeVideoView(
              me: callMembers.first,
            ),
          ),
        ],
      ),
    );
  }
}

class CallingViewCollaped extends StatelessWidget {
  const CallingViewCollaped({Key? key, required this.callMembers})
      : super(key: key);

  final List<CallMember> callMembers;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: callMembers
          .map((member) => TinyMeVideoView(
                me: member,
              ))
          .toList(),
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
      decoration: const BoxDecoration(
        borderRadius: kBorderRadius12,

        /// TODO: Get user video from camera.
        color: Colors.blueGrey,
      ),
    );
  }
}
