import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'upcoming_record.g.dart';

abstract class UpcomingRecord
    implements Built<UpcomingRecord, UpcomingRecordBuilder> {
  static Serializer<UpcomingRecord> get serializer =>
      _$upcomingRecordSerializer;

  @BuiltValueField(wireName: 'upcoming_date')
  DateTime? get upcomingDate;

  @BuiltValueField(wireName: 'upcoming_event_name')
  String? get upcomingEventName;

  @BuiltValueField(wireName: 'upcoming_event_club_name')
  String? get upcomingEventClubName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UpcomingRecordBuilder builder) => builder
    ..upcomingEventName = ''
    ..upcomingEventClubName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Upcoming');

  static Stream<UpcomingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UpcomingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UpcomingRecord._();
  factory UpcomingRecord([void Function(UpcomingRecordBuilder) updates]) =
      _$UpcomingRecord;

  static UpcomingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUpcomingRecordData({
  DateTime? upcomingDate,
  String? upcomingEventName,
  String? upcomingEventClubName,
}) {
  final firestoreData = serializers.toFirestore(
    UpcomingRecord.serializer,
    UpcomingRecord(
      (u) => u
        ..upcomingDate = upcomingDate
        ..upcomingEventName = upcomingEventName
        ..upcomingEventClubName = upcomingEventClubName,
    ),
  );

  return firestoreData;
}
