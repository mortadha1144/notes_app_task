import 'package:uuid/uuid.dart';

class Note {
  final String title;
  final String uuid;
  final DateTime createdAt;

  Note({
    required this.title,
    String? uuid,
    DateTime? createdAt,
  })  : uuid = uuid ?? const Uuid().v4(),// to generate a unique id
        createdAt = createdAt ?? DateTime.now();

  Note updated(String? title) => Note(
        title: title ?? this.title,
        createdAt: createdAt,
        uuid: uuid,
      );

  @override
  bool operator ==(covariant Note other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;
}
