// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventRecord> _$eventRecordSerializer = new _$EventRecordSerializer();

class _$EventRecordSerializer implements StructuredSerializer<EventRecord> {
  @override
  final Iterable<Type> types = const [EventRecord, _$EventRecord];
  @override
  final String wireName = 'EventRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.eventId;
    if (value != null) {
      result
        ..add('event_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventName;
    if (value != null) {
      result
        ..add('event_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventDescription;
    if (value != null) {
      result
        ..add('event_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventDate;
    if (value != null) {
      result
        ..add('event_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.eventClubName;
    if (value != null) {
      result
        ..add('event_club_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventAdminId;
    if (value != null) {
      result
        ..add('event_admin_id')
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
  EventRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'event_id':
          result.eventId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event_name':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event_description':
          result.eventDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event_date':
          result.eventDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'event_club_name':
          result.eventClubName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'event_admin_id':
          result.eventAdminId = serializers.deserialize(value,
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

class _$EventRecord extends EventRecord {
  @override
  final String? eventId;
  @override
  final String? eventName;
  @override
  final String? eventDescription;
  @override
  final DateTime? eventDate;
  @override
  final String? eventClubName;
  @override
  final String? eventAdminId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EventRecord([void Function(EventRecordBuilder)? updates]) =>
      (new EventRecordBuilder()..update(updates))._build();

  _$EventRecord._(
      {this.eventId,
      this.eventName,
      this.eventDescription,
      this.eventDate,
      this.eventClubName,
      this.eventAdminId,
      this.ffRef})
      : super._();

  @override
  EventRecord rebuild(void Function(EventRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventRecordBuilder toBuilder() => new EventRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventRecord &&
        eventId == other.eventId &&
        eventName == other.eventName &&
        eventDescription == other.eventDescription &&
        eventDate == other.eventDate &&
        eventClubName == other.eventClubName &&
        eventAdminId == other.eventAdminId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, eventId.hashCode);
    _$hash = $jc(_$hash, eventName.hashCode);
    _$hash = $jc(_$hash, eventDescription.hashCode);
    _$hash = $jc(_$hash, eventDate.hashCode);
    _$hash = $jc(_$hash, eventClubName.hashCode);
    _$hash = $jc(_$hash, eventAdminId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventRecord')
          ..add('eventId', eventId)
          ..add('eventName', eventName)
          ..add('eventDescription', eventDescription)
          ..add('eventDate', eventDate)
          ..add('eventClubName', eventClubName)
          ..add('eventAdminId', eventAdminId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EventRecordBuilder implements Builder<EventRecord, EventRecordBuilder> {
  _$EventRecord? _$v;

  String? _eventId;
  String? get eventId => _$this._eventId;
  set eventId(String? eventId) => _$this._eventId = eventId;

  String? _eventName;
  String? get eventName => _$this._eventName;
  set eventName(String? eventName) => _$this._eventName = eventName;

  String? _eventDescription;
  String? get eventDescription => _$this._eventDescription;
  set eventDescription(String? eventDescription) =>
      _$this._eventDescription = eventDescription;

  DateTime? _eventDate;
  DateTime? get eventDate => _$this._eventDate;
  set eventDate(DateTime? eventDate) => _$this._eventDate = eventDate;

  String? _eventClubName;
  String? get eventClubName => _$this._eventClubName;
  set eventClubName(String? eventClubName) =>
      _$this._eventClubName = eventClubName;

  String? _eventAdminId;
  String? get eventAdminId => _$this._eventAdminId;
  set eventAdminId(String? eventAdminId) => _$this._eventAdminId = eventAdminId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EventRecordBuilder() {
    EventRecord._initializeBuilder(this);
  }

  EventRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventId = $v.eventId;
      _eventName = $v.eventName;
      _eventDescription = $v.eventDescription;
      _eventDate = $v.eventDate;
      _eventClubName = $v.eventClubName;
      _eventAdminId = $v.eventAdminId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventRecord;
  }

  @override
  void update(void Function(EventRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventRecord build() => _build();

  _$EventRecord _build() {
    final _$result = _$v ??
        new _$EventRecord._(
            eventId: eventId,
            eventName: eventName,
            eventDescription: eventDescription,
            eventDate: eventDate,
            eventClubName: eventClubName,
            eventAdminId: eventAdminId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
