import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'club_record.g.dart';

abstract class ClubRecord implements Built<ClubRecord, ClubRecordBuilder> {
  static Serializer<ClubRecord> get serializer => _$clubRecordSerializer;

  @BuiltValueField(wireName: 'club_name')
  String? get clubName;

  @BuiltValueField(wireName: 'club_description')
  String? get clubDescription;

  @BuiltValueField(wireName: 'club_admin_id')
  String? get clubAdminId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ClubRecordBuilder builder) => builder
    ..clubName = ''
    ..clubDescription = ''
    ..clubAdminId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Club');

  static Stream<ClubRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ClubRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ClubRecord._();
  factory ClubRecord([void Function(ClubRecordBuilder) updates]) = _$ClubRecord;

  static ClubRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createClubRecordData({
  String? clubName,
  String? clubDescription,
  String? clubAdminId,
}) {
  final firestoreData = serializers.toFirestore(
    ClubRecord.serializer,
    ClubRecord(
      (c) => c
        ..clubName = clubName
        ..clubDescription = clubDescription
        ..clubAdminId = clubAdminId,
    ),
  );

  return firestoreData;
}
