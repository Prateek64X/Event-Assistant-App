import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'event_record.g.dart';

abstract class EventRecord implements Built<EventRecord, EventRecordBuilder> {
  static Serializer<EventRecord> get serializer => _$eventRecordSerializer;

  @BuiltValueField(wireName: 'event_id')
  String? get eventId;

  @BuiltValueField(wireName: 'event_name')
  String? get eventName;

  @BuiltValueField(wireName: 'event_description')
  String? get eventDescription;

  @BuiltValueField(wireName: 'event_date')
  DateTime? get eventDate;

  @BuiltValueField(wireName: 'event_club_name')
  String? get eventClubName;

  @BuiltValueField(wireName: 'event_admin_id')
  String? get eventAdminId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EventRecordBuilder builder) => builder
    ..eventId = ''
    ..eventName = ''
    ..eventDescription = ''
    ..eventClubName = ''
    ..eventAdminId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Event');

  static Stream<EventRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EventRecord._();
  factory EventRecord([void Function(EventRecordBuilder) updates]) =
      _$EventRecord;

  static EventRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEventRecordData({
  String? eventId,
  String? eventName,
  String? eventDescription,
  DateTime? eventDate,
  String? eventClubName,
  String? eventAdminId,
}) {
  final firestoreData = serializers.toFirestore(
    EventRecord.serializer,
    EventRecord(
      (e) => e
        ..eventId = eventId
        ..eventName = eventName
        ..eventDescription = eventDescription
        ..eventDate = eventDate
        ..eventClubName = eventClubName
        ..eventAdminId = eventAdminId,
    ),
  );

  return firestoreData;
}
