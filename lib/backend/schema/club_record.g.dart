// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClubRecord> _$clubRecordSerializer = new _$ClubRecordSerializer();

class _$ClubRecordSerializer implements StructuredSerializer<ClubRecord> {
  @override
  final Iterable<Type> types = const [ClubRecord, _$ClubRecord];
  @override
  final String wireName = 'ClubRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ClubRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.clubName;
    if (value != null) {
      result
        ..add('club_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clubDescription;
    if (value != null) {
      result
        ..add('club_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clubAdminId;
    if (value != null) {
      result
        ..add('club_admin_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ClubRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClubRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'club_name':
          result.clubName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'club_description':
          result.clubDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'club_admin_id':
          result.clubAdminId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ClubRecord extends ClubRecord {
  @override
  final String? clubName;
  @override
  final String? clubDescription;
  @override
  final String? clubAdminId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ClubRecord([void Function(ClubRecordBuilder)? updates]) =>
      (new ClubRecordBuilder()..update(updates))._build();

  _$ClubRecord._(
      {this.clubName, this.clubDescription, this.clubAdminId, this.ffRef})
      : super._();

  @override
  ClubRecord rebuild(void Function(ClubRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubRecordBuilder toBuilder() => new ClubRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubRecord &&
        clubName == other.clubName &&
        clubDescription == other.clubDescription &&
        clubAdminId == other.clubAdminId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clubName.hashCode);
    _$hash = $jc(_$hash, clubDescription.hashCode);
    _$hash = $jc(_$hash, clubAdminId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubRecord')
          ..add('clubName', clubName)
          ..add('clubDescription', clubDescription)
          ..add('clubAdminId', clubAdminId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ClubRecordBuilder implements Builder<ClubRecord, ClubRecordBuilder> {
  _$ClubRecord? _$v;

  String? _clubName;
  String? get clubName => _$this._clubName;
  set clubName(String? clubName) => _$this._clubName = clubName;

  String? _clubDescription;
  String? get clubDescription => _$this._clubDescription;
  set clubDescription(String? clubDescription) =>
      _$this._clubDescription = clubDescription;

  String? _clubAdminId;
  String? get clubAdminId => _$this._clubAdminId;
  set clubAdminId(String? clubAdminId) => _$this._clubAdminId = clubAdminId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ClubRecordBuilder() {
    ClubRecord._initializeBuilder(this);
  }

  ClubRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clubName = $v.clubName;
      _clubDescription = $v.clubDescription;
      _clubAdminId = $v.clubAdminId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClubRecord;
  }

  @override
  void update(void Function(ClubRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubRecord build() => _build();

  _$ClubRecord _build() {
    final _$result = _$v ??
        new _$ClubRecord._(
            clubName: clubName,
            clubDescription: clubDescription,
            clubAdminId: clubAdminId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
