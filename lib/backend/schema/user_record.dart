import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  String? get uid;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'full_name')
  String? get fullName;

  String? get password;

  String? get email;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..uid = ''
    ..displayName = ''
    ..fullName = ''
    ..password = ''
    ..email = ''
    ..phoneNumber = ''
    ..photoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserRecordData({
  String? uid,
  String? displayName,
  String? fullName,
  String? password,
  String? email,
  String? phoneNumber,
  String? photoUrl,
  DateTime? createdTime,
}) {
  final firestoreData = serializers.toFirestore(
    UserRecord.serializer,
    UserRecord(
      (u) => u
        ..uid = uid
        ..displayName = displayName
        ..fullName = fullName
        ..password = password
        ..email = email
        ..phoneNumber = phoneNumber
        ..photoUrl = photoUrl
        ..createdTime = createdTime,
    ),
  );

  return firestoreData;
}
