part of 'calling_page.dart';

/// The bottom modal sheet includes menu of the video call.
class MenuBottomModal extends StatelessWidget {
  const MenuBottomModal({Key? key, required this.controller}) : super(key: key);

  final DraggableScrollableController controller;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: controller,
      snap: true,
      initialChildSize: kDraggableMinHeightFraction,
      minChildSize: kDraggableMinHeightFraction,
      maxChildSize: kDraggableMaxHeightFraction,
      builder: ((context, scrollController) {
        return Container(
          padding: kPadding12,
          decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: ListView(
            padding: kPadding12,
            controller: scrollController,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 84,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: kBorderRadius36,
                  ),
                ),
              ),
              kSpace12,
              const MenuRow(),
              kSpace12,
              const SemiActionRow(),
              kSpace12,
              const TernaryActionRow(),
            ],
          ),
        );
      }),
    );
  }
}

class MenuRow extends StatelessWidget {
  const MenuRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icons.videocam,
        Icons.cameraswitch_rounded,
        Icons.keyboard_voice_sharp,
        Icons.local_phone_rounded
      ]
          .map((icon) => MenuIconButton(
                icon: icon,
              ))
          .toList(),
    );
  }
}

/// Icon lay in the [MenuRow]
class MenuIconButton extends StatelessWidget {
  const MenuIconButton({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPadding12,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class SemiActionRow extends StatelessWidget {
  const SemiActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SemiActionButton(
          icon: Icons.speaker_rounded,
          label: 'Speaker',
        ),
        SemiActionButton(
          icon: Icons.person_add_alt,
          label: 'Add people',
        )
      ],
    );
  }
}

class SemiActionButton extends StatelessWidget {
  const SemiActionButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(label.toUpperCase()),
      style: ElevatedButton.styleFrom(primary: Colors.grey),
    );
  }
}

class TernaryActionRow extends StatelessWidget {
  const TernaryActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: kPadding12,
          decoration:
              const BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
          child: const Icon(Icons.screen_share),
        ),
        kSpace12,
        const Text(
          'Share your screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
