///
//  Generated code. Do not modify.
//  source: flow/entities/block.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use blockDescriptor instead')
const Block$json = const {
  '1': 'Block',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    const {'1': 'parent_id', '3': 2, '4': 1, '5': 12, '10': 'parentId'},
    const {'1': 'height', '3': 3, '4': 1, '5': 4, '10': 'height'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    const {'1': 'collection_guarantees', '3': 5, '4': 3, '5': 11, '6': '.flow.entities.CollectionGuarantee', '10': 'collectionGuarantees'},
    const {'1': 'block_seals', '3': 6, '4': 3, '5': 11, '6': '.flow.entities.BlockSeal', '10': 'blockSeals'},
    const {'1': 'signatures', '3': 7, '4': 3, '5': 12, '10': 'signatures'},
    const {'1': 'execution_receipt_metaList', '3': 8, '4': 3, '5': 11, '6': '.flow.entities.ExecutionReceiptMeta', '10': 'executionReceiptMetaList'},
    const {'1': 'execution_result_list', '3': 9, '4': 3, '5': 11, '6': '.flow.entities.ExecutionResult', '10': 'executionResultList'},
  ],
};

/// Descriptor for `Block`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockDescriptor = $convert.base64Decode('CgVCbG9jaxIOCgJpZBgBIAEoDFICaWQSGwoJcGFyZW50X2lkGAIgASgMUghwYXJlbnRJZBIWCgZoZWlnaHQYAyABKARSBmhlaWdodBI4Cgl0aW1lc3RhbXAYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXASVwoVY29sbGVjdGlvbl9ndWFyYW50ZWVzGAUgAygLMiIuZmxvdy5lbnRpdGllcy5Db2xsZWN0aW9uR3VhcmFudGVlUhRjb2xsZWN0aW9uR3VhcmFudGVlcxI5CgtibG9ja19zZWFscxgGIAMoCzIYLmZsb3cuZW50aXRpZXMuQmxvY2tTZWFsUgpibG9ja1NlYWxzEh4KCnNpZ25hdHVyZXMYByADKAxSCnNpZ25hdHVyZXMSYQoaZXhlY3V0aW9uX3JlY2VpcHRfbWV0YUxpc3QYCCADKAsyIy5mbG93LmVudGl0aWVzLkV4ZWN1dGlvblJlY2VpcHRNZXRhUhhleGVjdXRpb25SZWNlaXB0TWV0YUxpc3QSUgoVZXhlY3V0aW9uX3Jlc3VsdF9saXN0GAkgAygLMh4uZmxvdy5lbnRpdGllcy5FeGVjdXRpb25SZXN1bHRSE2V4ZWN1dGlvblJlc3VsdExpc3Q=');
