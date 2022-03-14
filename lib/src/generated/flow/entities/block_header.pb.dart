///
//  Generated code. Do not modify.
//  source: flow/entities/block_header.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;

class BlockHeader extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BlockHeader', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp', subBuilder: $0.Timestamp.create)
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payloadHash', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'view', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$core.List<$core.int>>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentVoterIds', $pb.PbFieldType.PY)
    ..a<$core.List<$core.int>>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parentVoterSigData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposerId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposerSigData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chainId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BlockHeader._() : super();
  factory BlockHeader({
    $core.List<$core.int>? id,
    $core.List<$core.int>? parentId,
    $fixnum.Int64? height,
    $0.Timestamp? timestamp,
    $core.List<$core.int>? payloadHash,
    $fixnum.Int64? view,
    $core.Iterable<$core.List<$core.int>>? parentVoterIds,
    $core.List<$core.int>? parentVoterSigData,
    $core.List<$core.int>? proposerId,
    $core.List<$core.int>? proposerSigData,
    $core.List<$core.int>? chainId,
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
    if (payloadHash != null) {
      _result.payloadHash = payloadHash;
    }
    if (view != null) {
      _result.view = view;
    }
    if (parentVoterIds != null) {
      _result.parentVoterIds.addAll(parentVoterIds);
    }
    if (parentVoterSigData != null) {
      _result.parentVoterSigData = parentVoterSigData;
    }
    if (proposerId != null) {
      _result.proposerId = proposerId;
    }
    if (proposerSigData != null) {
      _result.proposerSigData = proposerSigData;
    }
    if (chainId != null) {
      _result.chainId = chainId;
    }
    return _result;
  }
  factory BlockHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockHeader clone() => BlockHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockHeader copyWith(void Function(BlockHeader) updates) => super.copyWith((message) => updates(message as BlockHeader)) as BlockHeader; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockHeader create() => BlockHeader._();
  BlockHeader createEmptyInstance() => create();
  static $pb.PbList<BlockHeader> createRepeated() => $pb.PbList<BlockHeader>();
  @$core.pragma('dart2js:noInline')
  static BlockHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockHeader>(create);
  static BlockHeader? _defaultInstance;

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
  $core.List<$core.int> get payloadHash => $_getN(4);
  @$pb.TagNumber(5)
  set payloadHash($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPayloadHash() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayloadHash() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get view => $_getI64(5);
  @$pb.TagNumber(6)
  set view($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasView() => $_has(5);
  @$pb.TagNumber(6)
  void clearView() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.List<$core.int>> get parentVoterIds => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get parentVoterSigData => $_getN(7);
  @$pb.TagNumber(8)
  set parentVoterSigData($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasParentVoterSigData() => $_has(7);
  @$pb.TagNumber(8)
  void clearParentVoterSigData() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get proposerId => $_getN(8);
  @$pb.TagNumber(9)
  set proposerId($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasProposerId() => $_has(8);
  @$pb.TagNumber(9)
  void clearProposerId() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get proposerSigData => $_getN(9);
  @$pb.TagNumber(10)
  set proposerSigData($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasProposerSigData() => $_has(9);
  @$pb.TagNumber(10)
  void clearProposerSigData() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.int> get chainId => $_getN(10);
  @$pb.TagNumber(11)
  set chainId($core.List<$core.int> v) { $_setBytes(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasChainId() => $_has(10);
  @$pb.TagNumber(11)
  void clearChainId() => clearField(11);
}

