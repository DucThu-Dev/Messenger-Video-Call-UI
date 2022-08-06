/// App data.
const members = [
  CallMember(id: '#00001', name: 'Ethan Tran', videoSource: ''),
  CallMember(id: '#00002', name: 'Duc Thu', videoSource: ''),
];

class CallMember {
  const CallMember({
    required this.id,
    required this.name,
    required this.videoSource,
  });

  final String id;
  final String name;
  final String videoSource;
}
