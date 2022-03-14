///
//  Generated code. Do not modify.
//  source: flow/entities/block_header.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use blockHeaderDescriptor instead')
const BlockHeader$json = const {
  '1': 'BlockHeader',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    const {'1': 'parent_id', '3': 2, '4': 1, '5': 12, '10': 'parentId'},
    const {'1': 'height', '3': 3, '4': 1, '5': 4, '10': 'height'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    const {'1': 'payload_hash', '3': 5, '4': 1, '5': 12, '10': 'payloadHash'},
    const {'1': 'view', '3': 6, '4': 1, '5': 4, '10': 'view'},
    const {'1': 'parent_voter_ids', '3': 7, '4': 3, '5': 12, '10': 'parentVoterIds'},
    const {'1': 'parent_voter_sig_data', '3': 8, '4': 1, '5': 12, '10': 'parentVoterSigData'},
    const {'1': 'proposer_id', '3': 9, '4': 1, '5': 12, '10': 'proposerId'},
    const {'1': 'proposer_sig_data', '3': 10, '4': 1, '5': 12, '10': 'proposerSigData'},
    const {'1': 'chain_id', '3': 11, '4': 1, '5': 12, '10': 'chainId'},
  ],
};

/// Descriptor for `BlockHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockHeaderDescriptor = $convert.base64Decode('CgtCbG9ja0hlYWRlchIOCgJpZBgBIAEoDFICaWQSGwoJcGFyZW50X2lkGAIgASgMUghwYXJlbnRJZBIWCgZoZWlnaHQYAyABKARSBmhlaWdodBI4Cgl0aW1lc3RhbXAYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXASIQoMcGF5bG9hZF9oYXNoGAUgASgMUgtwYXlsb2FkSGFzaBISCgR2aWV3GAYgASgEUgR2aWV3EigKEHBhcmVudF92b3Rlcl9pZHMYByADKAxSDnBhcmVudFZvdGVySWRzEjEKFXBhcmVudF92b3Rlcl9zaWdfZGF0YRgIIAEoDFIScGFyZW50Vm90ZXJTaWdEYXRhEh8KC3Byb3Bvc2VyX2lkGAkgASgMUgpwcm9wb3NlcklkEioKEXByb3Bvc2VyX3NpZ19kYXRhGAogASgMUg9wcm9wb3NlclNpZ0RhdGESGQoIY2hhaW5faWQYCyABKAxSB2NoYWluSWQ=');
