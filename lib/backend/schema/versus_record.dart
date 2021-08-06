import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'versus_record.g.dart';

abstract class VersusRecord
    implements Built<VersusRecord, VersusRecordBuilder> {
  static Serializer<VersusRecord> get serializer => _$versusRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'topic_a')
  DocumentReference get topicA;

  @nullable
  @BuiltValueField(wireName: 'topic_b')
  DocumentReference get topicB;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VersusRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('versus');

  static Stream<VersusRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VersusRecord._();
  factory VersusRecord([void Function(VersusRecordBuilder) updates]) =
      _$VersusRecord;

  static VersusRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createVersusRecordData({
  DocumentReference topicA,
  DocumentReference topicB,
  DateTime createdTime,
}) =>
    serializers.toFirestore(
        VersusRecord.serializer,
        VersusRecord((v) => v
          ..topicA = topicA
          ..topicB = topicB
          ..createdTime = createdTime));
