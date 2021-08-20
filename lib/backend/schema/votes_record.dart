import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'votes_record.g.dart';

abstract class VotesRecord implements Built<VotesRecord, VotesRecordBuilder> {
  static Serializer<VotesRecord> get serializer => _$votesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'voted_a')
  bool get votedA;

  @nullable
  @BuiltValueField(wireName: 'voted_b')
  bool get votedB;

  @nullable
  @BuiltValueField(wireName: 'voted_versus')
  DocumentReference get votedVersus;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VotesRecordBuilder builder) => builder
    ..votedA = false
    ..votedB = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('votes');

  static Stream<VotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VotesRecord._();
  factory VotesRecord([void Function(VotesRecordBuilder) updates]) =
      _$VotesRecord;

  static VotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createVotesRecordData({
  DateTime createdTime,
  DocumentReference user,
  bool votedA,
  bool votedB,
  DocumentReference votedVersus,
}) =>
    serializers.toFirestore(
        VotesRecord.serializer,
        VotesRecord((v) => v
          ..createdTime = createdTime
          ..user = user
          ..votedA = votedA
          ..votedB = votedB
          ..votedVersus = votedVersus));
