class Event {
  final String event_id;
  final String event_name;
  final String event_description;
  final DateTime event_date;
  final String event_club_name;
  final String event_admin_id;

  Event({
    required this.event_id,
    required this.event_name,
    required this.event_description,
    required this.event_date,
    required this.event_club_name,
    required this.event_admin_id,
  });

  String get event_title {
    return '$event_name - $event_date'; // or any other desired format
  }
}
