import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_id" field.
  String? _eventId;
  String get eventId => _eventId ?? '';
  bool hasEventId() => _eventId != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_description" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "event_club_name" field.
  String? _eventClubName;
  String get eventClubName => _eventClubName ?? '';
  bool hasEventClubName() => _eventClubName != null;

  // "event_admin_id" field.
  String? _eventAdminId;
  String get eventAdminId => _eventAdminId ?? '';
  bool hasEventAdminId() => _eventAdminId != null;

  // "event_end_date" field.
  DateTime? _eventEndDate;
  DateTime? get eventEndDate => _eventEndDate;
  bool hasEventEndDate() => _eventEndDate != null;

  // "event_form_link" field.
  String? _eventFormLink;
  String get eventFormLink => _eventFormLink ?? '';
  bool hasEventFormLink() => _eventFormLink != null;

  // "event_community_link" field.
  String? _eventCommunityLink;
  String get eventCommunityLink => _eventCommunityLink ?? '';
  bool hasEventCommunityLink() => _eventCommunityLink != null;

  void _initializeFields() {
    _eventId = snapshotData['event_id'] as String?;
    _eventName = snapshotData['event_name'] as String?;
    _eventDescription = snapshotData['event_description'] as String?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _eventClubName = snapshotData['event_club_name'] as String?;
    _eventAdminId = snapshotData['event_admin_id'] as String?;
    _eventEndDate = snapshotData['event_end_date'] as DateTime?;
    _eventFormLink = snapshotData['event_form_link'] as String?;
    _eventCommunityLink = snapshotData['event_community_link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? eventId,
  String? eventName,
  String? eventDescription,
  DateTime? eventDate,
  String? eventClubName,
  String? eventAdminId,
  DateTime? eventEndDate,
  String? eventFormLink,
  String? eventCommunityLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_id': eventId,
      'event_name': eventName,
      'event_description': eventDescription,
      'event_date': eventDate,
      'event_club_name': eventClubName,
      'event_admin_id': eventAdminId,
      'event_end_date': eventEndDate,
      'event_form_link': eventFormLink,
      'event_community_link': eventCommunityLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    return e1?.eventId == e2?.eventId &&
        e1?.eventName == e2?.eventName &&
        e1?.eventDescription == e2?.eventDescription &&
        e1?.eventDate == e2?.eventDate &&
        e1?.eventClubName == e2?.eventClubName &&
        e1?.eventAdminId == e2?.eventAdminId &&
        e1?.eventEndDate == e2?.eventEndDate &&
        e1?.eventFormLink == e2?.eventFormLink &&
        e1?.eventCommunityLink == e2?.eventCommunityLink;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.eventId,
        e?.eventName,
        e?.eventDescription,
        e?.eventDate,
        e?.eventClubName,
        e?.eventAdminId,
        e?.eventEndDate,
        e?.eventFormLink,
        e?.eventCommunityLink
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
