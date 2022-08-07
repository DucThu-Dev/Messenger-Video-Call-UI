/// App data.
const members = [
  CallMember(
      id: '#00001',
      name: 'Roronoa Zoro',
      videoSource:
          'https://i.pinimg.com/736x/d1/3a/ab/d13aabae7d964d443b0bbfcdf242e86c.jpg'),
  CallMember(
      id: '#00002',
      name: 'Monkey D. Luffy',
      videoSource:
          'https://image.winudf.com/v2/image/Y29tLmJhbGVmb290Lk1vbmtleURMdWZmeVdhbGxwYXBlcl9zY3JlZW5fMF8xNTI0NTE5MTEwXzAyOA/screen-0.jpg?fakeurl=1&type=.webp'),
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
