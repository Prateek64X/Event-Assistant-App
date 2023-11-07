import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubRecord extends FirestoreRecord {
  ClubRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "club_name" field.
  String? _clubName;
  String get clubName => _clubName ?? '';
  bool hasClubName() => _clubName != null;

  // "club_description" field.
  String? _clubDescription;
  String get clubDescription => _clubDescription ?? '';
  bool hasClubDescription() => _clubDescription != null;

  // "club_admin_id" field.
  String? _clubAdminId;
  String get clubAdminId => _clubAdminId ?? '';
  bool hasClubAdminId() => _clubAdminId != null;

  // "club_img" field.
  String? _clubImg;
  String get clubImg => _clubImg ?? '';
  bool hasClubImg() => _clubImg != null;

  void _initializeFields() {
    _clubName = snapshotData['club_name'] as String?;
    _clubDescription = snapshotData['club_description'] as String?;
    _clubAdminId = snapshotData['club_admin_id'] as String?;
    _clubImg = snapshotData['club_img'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Club');

  static Stream<ClubRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClubRecord.fromSnapshot(s));

  static Future<ClubRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClubRecord.fromSnapshot(s));

  static ClubRecord fromSnapshot(DocumentSnapshot snapshot) => ClubRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClubRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClubRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClubRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClubRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClubRecordData({
  String? clubName,
  String? clubDescription,
  String? clubAdminId,
  String? clubImg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'club_name': clubName,
      'club_description': clubDescription,
      'club_admin_id': clubAdminId,
      'club_img': clubImg,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClubRecordDocumentEquality implements Equality<ClubRecord> {
  const ClubRecordDocumentEquality();

  @override
  bool equals(ClubRecord? e1, ClubRecord? e2) {
    return e1?.clubName == e2?.clubName &&
        e1?.clubDescription == e2?.clubDescription &&
        e1?.clubAdminId == e2?.clubAdminId &&
        e1?.clubImg == e2?.clubImg;
  }

  @override
  int hash(ClubRecord? e) => const ListEquality()
      .hash([e?.clubName, e?.clubDescription, e?.clubAdminId, e?.clubImg]);

  @override
  bool isValidKey(Object? o) => o is ClubRecord;
}
