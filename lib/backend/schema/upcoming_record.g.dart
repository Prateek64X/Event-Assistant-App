// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpcomingRecord> _$upcomingRecordSerializer =
    new _$UpcomingRecordSerializer();

class _$UpcomingRecordSerializer
    implements StructuredSerializer<UpcomingRecord> {
  @override
  final Iterable<Type> types = const [UpcomingRecord, _$UpcomingRecord];
  @override
  final String wireName = 'UpcomingRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UpcomingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.upcomingDate;
    if (value != null) {
      result
        ..add('upcoming_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.upcomingEventName;
    if (value != null) {
      result
        ..add('upcoming_event_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.upcomingEventClubName;
    if (value != null) {
      result
        ..add('upcoming_event_club_name')
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
  UpcomingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpcomingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'upcoming_date':
          result.upcomingDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'upcoming_event_name':
          result.upcomingEventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'upcoming_event_club_name':
          result.upcomingEventClubName = serializers.deserialize(value,
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

class _$UpcomingRecord extends UpcomingRecord {
  @override
  final DateTime? upcomingDate;
  @override
  final String? upcomingEventName;
  @override
  final String? upcomingEventClubName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UpcomingRecord([void Function(UpcomingRecordBuilder)? updates]) =>
      (new UpcomingRecordBuilder()..update(updates))._build();

  _$UpcomingRecord._(
      {this.upcomingDate,
      this.upcomingEventName,
      this.upcomingEventClubName,
      this.ffRef})
      : super._();

  @override
  UpcomingRecord rebuild(void Function(UpcomingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpcomingRecordBuilder toBuilder() =>
      new UpcomingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpcomingRecord &&
        upcomingDate == other.upcomingDate &&
        upcomingEventName == other.upcomingEventName &&
        upcomingEventClubName == other.upcomingEventClubName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, upcomingDate.hashCode);
    _$hash = $jc(_$hash, upcomingEventName.hashCode);
    _$hash = $jc(_$hash, upcomingEventClubName.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpcomingRecord')
          ..add('upcomingDate', upcomingDate)
          ..add('upcomingEventName', upcomingEventName)
          ..add('upcomingEventClubName', upcomingEventClubName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UpcomingRecordBuilder
    implements Builder<UpcomingRecord, UpcomingRecordBuilder> {
  _$UpcomingRecord? _$v;

  DateTime? _upcomingDate;
  DateTime? get upcomingDate => _$this._upcomingDate;
  set upcomingDate(DateTime? upcomingDate) =>
      _$this._upcomingDate = upcomingDate;

  String? _upcomingEventName;
  String? get upcomingEventName => _$this._upcomingEventName;
  set upcomingEventName(String? upcomingEventName) =>
      _$this._upcomingEventName = upcomingEventName;

  String? _upcomingEventClubName;
  String? get upcomingEventClubName => _$this._upcomingEventClubName;
  set upcomingEventClubName(String? upcomingEventClubName) =>
      _$this._upcomingEventClubName = upcomingEventClubName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UpcomingRecordBuilder() {
    UpcomingRecord._initializeBuilder(this);
  }

  UpcomingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _upcomingDate = $v.upcomingDate;
      _upcomingEventName = $v.upcomingEventName;
      _upcomingEventClubName = $v.upcomingEventClubName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpcomingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpcomingRecord;
  }

  @override
  void update(void Function(UpcomingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpcomingRecord build() => _build();

  _$UpcomingRecord _build() {
    final _$result = _$v ??
        new _$UpcomingRecord._(
            upcomingDate: upcomingDate,
            upcomingEventName: upcomingEventName,
            upcomingEventClubName: upcomingEventClubName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
