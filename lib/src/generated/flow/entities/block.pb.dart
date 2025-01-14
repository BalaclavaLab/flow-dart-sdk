///
//  Generated code. Do not modify.
//  source: flow/entities/block.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;
import 'collection.pb.dart' as $1;
import 'block_seal.pb.dart' as $2;
import 'execution_result.pb.dart' as $3;

class Block extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Block', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp', subBuilder: $0.Timestamp.create)
    ..pc<$1.CollectionGuarantee>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'collectionGuarantees', $pb.PbFieldType.PM, subBuilder: $1.CollectionGuarantee.create)
    ..pc<$2.BlockSeal>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blockSeals', $pb.PbFieldType.PM, subBuilder: $2.BlockSeal.create)
    ..p<$core.List<$core.int>>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signatures', $pb.PbFieldType.PY)
    ..pc<$3.ExecutionReceiptMeta>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'executionReceiptMetaList', $pb.PbFieldType.PM, protoName: 'execution_receipt_metaList', subBuilder: $3.ExecutionReceiptMeta.create)
    ..pc<$3.ExecutionResult>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'executionResultList', $pb.PbFieldType.PM, subBuilder: $3.ExecutionResult.create)
    ..hasRequiredFields = false
  ;

  Block._() : super();
  factory Block({
    $core.List<$core.int>? id,
    $core.List<$core.int>? parentId,
    $fixnum.Int64? height,
    $0.Timestamp? timestamp,
    $core.Iterable<$1.CollectionGuarantee>? collectionGuarantees,
    $core.Iterable<$2.BlockSeal>? blockSeals,
    $core.Iterable<$core.List<$core.int>>? signatures,
    $core.Iterable<$3.ExecutionReceiptMeta>? executionReceiptMetaList,
    $core.Iterable<$3.ExecutionResult>? executionResultList,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (parentId != null) {
      _result.parentId = parentId;
    }
    if (height != null) {
      _result.height = height;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (collectionGuarantees != null) {
      _result.collectionGuarantees.addAll(collectionGuarantees);
    }
    if (blockSeals != null) {
      _result.blockSeals.addAll(blockSeals);
    }
    if (signatures != null) {
      _result.signatures.addAll(signatures);
    }
    if (executionReceiptMetaList != null) {
      _result.executionReceiptMetaList.addAll(executionReceiptMetaList);
    }
    if (executionResultList != null) {
      _result.executionResultList.addAll(executionResultList);
    }
    return _result;
  }
  factory Block.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Block.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Block clone() => Block()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Block copyWith(void Function(Block) updates) => super.copyWith((message) => updates(message as Block)) as Block; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Block create() => Block._();
  Block createEmptyInstance() => create();
  static $pb.PbList<Block> createRepeated() => $pb.PbList<Block>();
  @$core.pragma('dart2js:noInline')
  static Block getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Block>(create);
  static Block? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get parentId => $_getN(1);
  @$pb.TagNumber(2)
  set parentId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get height => $_getI64(2);
  @$pb.TagNumber(3)
  set height($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(4)
  set timestamp($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureTimestamp() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<$1.CollectionGuarantee> get collectionGuarantees => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$2.BlockSeal> get blockSeals => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.List<$core.int>> get signatures => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$3.ExecutionReceiptMeta> get executionReceiptMetaList => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$3.ExecutionResult> get executionResultList => $_getList(8);
}

