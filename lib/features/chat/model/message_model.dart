class MessageModel {
  MessageModel({
    required this.message,
    required this.sender,
    required this.receiver,
    required this.timestamp,
    required this.isSeenByReceiver,
    this.messageId,
    this.isImage,
  });

  final String message;
  final String sender;
  final String receiver;
  final String? messageId;
  final DateTime timestamp;
  final bool isSeenByReceiver;
  final bool? isImage;
}

final messages = [
  MessageModel(
    message: 'Hello',
    sender: '101',
    receiver: '202',
    timestamp: DateTime(2024, 1, 1),
    isSeenByReceiver: true,
  ),
  MessageModel(
    message: 'Hello, how are you? I am fine.',
    sender: '202',
    receiver: '101',
    timestamp: DateTime(2024, 1, 2),
    isSeenByReceiver: false,
  ),
  MessageModel(
    message: 'how are you?',
    sender: '101',
    receiver: '202',
    timestamp: DateTime(2024, 1, 3),
    isSeenByReceiver: false,
  ),
];
