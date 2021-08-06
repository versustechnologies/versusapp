import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'topics_record.g.dart';

abstract class TopicsRecord
    implements Built<TopicsRecord, TopicsRecordBuilder> {
  static Serializer<TopicsRecord> get serializer => _$topicsRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TopicsRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topics');

  static Stream<TopicsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TopicsRecord._();
  factory TopicsRecord([void Function(TopicsRecordBuilder) updates]) =
      _$TopicsRecord;

  static TopicsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTopicsRecordData({
  String name,
  DateTime createdTime,
}) =>
    serializers.toFirestore(
        TopicsRecord.serializer,
        TopicsRecord((t) => t
          ..name = name
          ..createdTime = createdTime));
