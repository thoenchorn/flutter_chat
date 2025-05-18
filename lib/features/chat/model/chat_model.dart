class Chat {
  /// Unique identifier for the chat
  final int id;

  /// URL path to the avatar image
  final String avatarUrl;

  /// Name of the chat participant
  final String name;

  /// Last message in the chat
  final String message;

  /// Time when the last message was sent
  final String time;

  /// Whether the last message has been read
  final bool isMessageRead;

  /// Whether the user is currently online
  final bool online;

  /// Number of unread messages
  final int? countMessage;

  /// Creates a new chat item
  const Chat({
    required this.id,
    required this.avatarUrl,
    required this.name,
    required this.message,
    required this.time,
    this.isMessageRead = false,
    this.online = false,
    this.countMessage,
  });

  /// Creates a copy of this chat with the given fields replaced with new values
  Chat copyWith({
    int? id,
    String? avatarUrl,
    String? name,
    String? message,
    String? time,
    bool? isMessageRead,
    bool? online,
    int? countMessage,
  }) {
    return Chat(
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      name: name ?? this.name,
      message: message ?? this.message,
      time: time ?? this.time,
      isMessageRead: isMessageRead ?? this.isMessageRead,
      online: online ?? this.online,
      countMessage: countMessage ?? this.countMessage,
    );
  }

  /// Creates a list of 10 sample chat items for testing or demo purposes
  static List<Chat> getSampleChats() {
    return [
      const Chat(
        id: 1,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Rat Raksmey',
        message: 'Hi, how are you doing today?',
        time: '10:00 AM',
        isMessageRead: true,
        online: true,
        countMessage: 3,
      ),
      const Chat(
        id: 2,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Sok Dara',
        message: 'Are we still meeting for lunch?',
        time: '09:45 AM',
        isMessageRead: false,
        online: true,
      ),
      const Chat(
        id: 3,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Chan Somaly',
        message: 'I just sent you the project files',
        time: 'Yesterday',
        isMessageRead: true,
        online: false,
        countMessage: 1,
      ),
      const Chat(
        id: 4,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Pheng Vibol',
        message: 'Thanks for your help with the report',
        time: 'Yesterday',
        isMessageRead: true,
        online: false,
      ),
      const Chat(
        id: 5,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Kim Sothea',
        message: 'Can you call me when you get a chance?',
        time: 'Monday',
        isMessageRead: true,
        online: true,
        countMessage: 5,
      ),
      const Chat(
        id: 6,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Tep Veasna',
        message: 'The meeting has been rescheduled to 3PM',
        time: 'Monday',
        isMessageRead: false,
        online: false,
      ),
      const Chat(
        id: 7,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Heng Sopheap',
        message: 'Did you see the latest updates?',
        time: 'Last week',
        isMessageRead: true,
        online: true,
        countMessage: 2,
      ),
      const Chat(
        id: 8,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Meas Sokhom',
        message: 'Let me know when you finish the task',
        time: 'Last week',
        isMessageRead: false,
        online: false,
      ),
      const Chat(
        id: 9,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Ly Sothy',
        message: 'I found the solution to the problem',
        time: '23/05/2023',
        isMessageRead: true,
        online: true,
      ),
      const Chat(
        id: 10,
        avatarUrl: 'assets/images/pf_null.png',
        name: 'Nhem Chanthy',
        message: 'We need to discuss the new requirements',
        time: '20/05/2023',
        isMessageRead: true,
        online: false,
        countMessage: 7,
      ),
    ];
  }
}

/// create list chat 10items static data
/// Creates a list of 10 sample chat items for testing or demo purposes
List<Chat> getSampleChats() {
  return [
    const Chat(
      id: 1,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Rat Raksmey',
      message: 'Hi, how are you doing today?',
      time: '10:00 AM',
      isMessageRead: true,
      online: true,
      countMessage: 3,
    ),
    const Chat(
      id: 2,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Sok Dara',
      message: 'Are we still meeting for lunch?',
      time: '09:45 AM',
      isMessageRead: false,
      online: true,
    ),
    const Chat(
      id: 3,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Chan Somaly',
      message: 'I just sent you the project files',
      time: 'Yesterday',
      isMessageRead: true,
      online: false,
      countMessage: 1,
    ),
    const Chat(
      id: 4,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Pheng Vibol',
      message: 'Thanks for your help with the report',
      time: 'Yesterday',
      isMessageRead: true,
      online: false,
      countMessage: 1,
    ),
    const Chat(
      id: 5,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Kim Sothea',
      message: 'Can you call me when you get a chance?',
      time: 'Monday',
      isMessageRead: true,
      online: true,
      countMessage: 5,
    ),
    const Chat(
      id: 6,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Tep Veasna',
      message: 'The meeting has been rescheduled to 3PM',
      time: 'Monday',
      isMessageRead: false,
      online: false,
    ),
    const Chat(
      id: 7,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Heng Sopheap',
      message: 'Did you see the latest updates?',
      time: 'Last week',
      isMessageRead: true,
      online: true,
      countMessage: 2,
    ),
    const Chat(
      id: 8,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Meas Sokhom',
      message: 'Let me know when you finish the task',
      time: 'Last week',
      isMessageRead: false,
      online: false,
    ),
    const Chat(
      id: 9,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Ly Sothy',
      message: 'I found the solution to the problem',
      time: '23/05/2023',
      isMessageRead: true,
      online: true,
      countMessage: 1,
    ),
    const Chat(
      id: 10,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Nhem Chanthy',
      message: 'We need to discuss the new requirements',
      time: '20/05/2023',
      isMessageRead: true,
      online: false,
      countMessage: 7,
    ),
    const Chat(
      id: 9,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Ly Sothy',
      message: 'I found the solution to the problem',
      time: '23/05/2023',
      isMessageRead: true,
      online: true,
      countMessage: 1,
    ),
    const Chat(
      id: 10,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Nhem Chanthy',
      message: 'We need to discuss the new requirements',
      time: '20/05/2023',
      isMessageRead: true,
      online: false,
      countMessage: 7,
    ),
    const Chat(
      id: 9,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Ly Sothy',
      message: 'I found the solution to the problem',
      time: '23/05/2023',
      isMessageRead: true,
      online: true,
      countMessage: 1,
    ),
    const Chat(
      id: 10,
      avatarUrl: 'assets/images/pf_null.png',
      name: 'Nhem Chanthy',
      message: 'We need to discuss the new requirements',
      time: '20/05/2023',
      isMessageRead: true,
      online: false,
      countMessage: 7,
    ),
  ];
}
