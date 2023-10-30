import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpcomingRecord extends FirestoreRecord {
  UpcomingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "upcoming_date" field.
  DateTime? _upcomingDate;
  DateTime? get upcomingDate => _upcomingDate;
  bool hasUpcomingDate() => _upcomingDate != null;

  // "upcoming_event_name" field.
  String? _upcomingEventName;
  String get upcomingEventName => _upcomingEventName ?? '';
  bool hasUpcomingEventName() => _upcomingEventName != null;

  // "upcoming_event_club_name" field.
  String? _upcomingEventClubName;
  String get upcomingEventClubName => _upcomingEventClubName ?? '';
  bool hasUpcomingEventClubName() => _upcomingEventClubName != null;

  void _initializeFields() {
    _upcomingDate = snapshotData['upcoming_date'] as DateTime?;
    _upcomingEventName = snapshotData['upcoming_event_name'] as String?;
    _upcomingEventClubName =
        snapshotData['upcoming_event_club_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Upcoming');

  static Stream<UpcomingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpcomingRecord.fromSnapshot(s));

  static Future<UpcomingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpcomingRecord.fromSnapshot(s));

  static UpcomingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpcomingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpcomingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpcomingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpcomingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpcomingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpcomingRecordData({
  DateTime? upcomingDate,
  String? upcomingEventName,
  String? upcomingEventClubName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'upcoming_date': upcomingDate,
      'upcoming_event_name': upcomingEventName,
      'upcoming_event_club_name': upcomingEventClubName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UpcomingRecordDocumentEquality implements Equality<UpcomingRecord> {
  const UpcomingRecordDocumentEquality();

  @override
  bool equals(UpcomingRecord? e1, UpcomingRecord? e2) {
    return e1?.upcomingDate == e2?.upcomingDate &&
        e1?.upcomingEventName == e2?.upcomingEventName &&
        e1?.upcomingEventClubName == e2?.upcomingEventClubName;
  }

  @override
  int hash(UpcomingRecord? e) => const ListEquality()
      .hash([e?.upcomingDate, e?.upcomingEventName, e?.upcomingEventClubName]);

  @override
  bool isValidKey(Object? o) => o is UpcomingRecord;
}
