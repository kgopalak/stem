/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: proto/tensor.proto
 *
 */

import Foundation
import SwiftProtobuf


public struct Stem_Serialize_header: ProtobufGeneratedMessage {
  public var swiftClassName: String {return "Stem_Serialize_header"}
  public var protoMessageName: String {return "header"}
  public var protoPackageName: String {return "stem.serialize"}
  public var jsonFieldNames: [String: Int] {return [
    "type": 1,
    "rows": 2,
    "cols": 3,
    "stride": 4,
    "shape": 5,
    "dimIndex": 6,
    "offset": 7,
  ]}
  public var protoFieldNames: [String: Int] {return [
    "type": 1,
    "rows": 2,
    "cols": 3,
    "stride": 4,
    "shape": 5,
    "dimIndex": 6,
    "offset": 7,
  ]}

  public var type: String = ""

  public var rows: Int64 = 0

  public var cols: Int64 = 0

  public var stride: Int64 = 0

  public var shape: Int64 = 0

  public var dimIndex: Int64 = 0

  public var offset: Int64 = 0

  public init() {}

  public init(type: String? = nil,
    rows: Int64? = nil,
    cols: Int64? = nil,
    stride: Int64? = nil,
    shape: Int64? = nil,
    dimIndex: Int64? = nil,
    offset: Int64? = nil)
  {
    if let v = type {
      self.type = v
    }
    if let v = rows {
      self.rows = v
    }
    if let v = cols {
      self.cols = v
    }
    if let v = stride {
      self.stride = v
    }
    if let v = shape {
      self.shape = v
    }
    if let v = dimIndex {
      self.dimIndex = v
    }
    if let v = offset {
      self.offset = v
    }
  }

  public mutating func _protoc_generated_decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
    let handled: Bool
    switch protoFieldNumber {
    case 1: handled = try setter.decodeSingularField(fieldType: ProtobufString.self, value: &type)
    case 2: handled = try setter.decodeSingularField(fieldType: ProtobufInt64.self, value: &rows)
    case 3: handled = try setter.decodeSingularField(fieldType: ProtobufInt64.self, value: &cols)
    case 4: handled = try setter.decodeSingularField(fieldType: ProtobufInt64.self, value: &stride)
    case 5: handled = try setter.decodeSingularField(fieldType: ProtobufInt64.self, value: &shape)
    case 6: handled = try setter.decodeSingularField(fieldType: ProtobufInt64.self, value: &dimIndex)
    case 7: handled = try setter.decodeSingularField(fieldType: ProtobufInt64.self, value: &offset)
    default:
      handled = false
    }
    return handled
  }

  public func _protoc_generated_traverse(visitor: inout ProtobufVisitor) throws {
    if type != "" {
      try visitor.visitSingularField(fieldType: ProtobufString.self, value: type, protoFieldNumber: 1, protoFieldName: "type", jsonFieldName: "type", swiftFieldName: "type")
    }
    if rows != 0 {
      try visitor.visitSingularField(fieldType: ProtobufInt64.self, value: rows, protoFieldNumber: 2, protoFieldName: "rows", jsonFieldName: "rows", swiftFieldName: "rows")
    }
    if cols != 0 {
      try visitor.visitSingularField(fieldType: ProtobufInt64.self, value: cols, protoFieldNumber: 3, protoFieldName: "cols", jsonFieldName: "cols", swiftFieldName: "cols")
    }
    if stride != 0 {
      try visitor.visitSingularField(fieldType: ProtobufInt64.self, value: stride, protoFieldNumber: 4, protoFieldName: "stride", jsonFieldName: "stride", swiftFieldName: "stride")
    }
    if shape != 0 {
      try visitor.visitSingularField(fieldType: ProtobufInt64.self, value: shape, protoFieldNumber: 5, protoFieldName: "shape", jsonFieldName: "shape", swiftFieldName: "shape")
    }
    if dimIndex != 0 {
      try visitor.visitSingularField(fieldType: ProtobufInt64.self, value: dimIndex, protoFieldNumber: 6, protoFieldName: "dimIndex", jsonFieldName: "dimIndex", swiftFieldName: "dimIndex")
    }
    if offset != 0 {
      try visitor.visitSingularField(fieldType: ProtobufInt64.self, value: offset, protoFieldNumber: 7, protoFieldName: "offset", jsonFieldName: "offset", swiftFieldName: "offset")
    }
  }

  public func _protoc_generated_isEqualTo(other: Stem_Serialize_header) -> Bool {
    if type != other.type {return false}
    if rows != other.rows {return false}
    if cols != other.cols {return false}
    if stride != other.stride {return false}
    if shape != other.shape {return false}
    if dimIndex != other.dimIndex {return false}
    if offset != other.offset {return false}
    return true
  }
}

public struct Stem_Serialize_tensor: ProtobufGeneratedMessage {
  public var swiftClassName: String {return "Stem_Serialize_tensor"}
  public var protoMessageName: String {return "tensor"}
  public var protoPackageName: String {return "stem.serialize"}
  public var jsonFieldNames: [String: Int] {return [
    "properties": 1,
    "data": 2,
  ]}
  public var protoFieldNames: [String: Int] {return [
    "properties": 1,
    "data": 2,
  ]}

  private class _StorageClass {
    typealias ProtobufExtendedMessage = Stem_Serialize_tensor
    var _properties: Stem_Serialize_header? = nil
    var _data: Data = Data()

    init() {}

    func decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
      let handled: Bool
      switch protoFieldNumber {
      case 1: handled = try setter.decodeSingularMessageField(fieldType: Stem_Serialize_header.self, value: &_properties)
      case 2: handled = try setter.decodeSingularField(fieldType: ProtobufBytes.self, value: &_data)
      default:
        handled = false
      }
      return handled
    }

    func traverse(visitor: inout ProtobufVisitor) throws {
      if let v = _properties {
        try visitor.visitSingularMessageField(value: v, protoFieldNumber: 1, protoFieldName: "properties", jsonFieldName: "properties", swiftFieldName: "properties")
      }
      if _data != Data() {
        try visitor.visitSingularField(fieldType: ProtobufBytes.self, value: _data, protoFieldNumber: 2, protoFieldName: "data", jsonFieldName: "data", swiftFieldName: "data")
      }
    }

    func isEqualTo(other: _StorageClass) -> Bool {
      if _properties != other._properties {return false}
      if _data != other._data {return false}
      return true
    }

    func copy() -> _StorageClass {
      let clone = _StorageClass()
      clone._properties = _properties
      clone._data = _data
      return clone
    }
  }

  private var _storage = _StorageClass()

  public var properties: Stem_Serialize_header {
    get {return _storage._properties ?? Stem_Serialize_header()}
    set {_uniqueStorage()._properties = newValue}
  }

  public var data: Data {
    get {return _storage._data}
    set {_uniqueStorage()._data = newValue}
  }

  public init() {}

  public init(properties: Stem_Serialize_header? = nil,
    data: Data? = nil)
  {
    let storage = _uniqueStorage()
    storage._properties = properties
    if let v = data {
      storage._data = v
    }
  }

  public mutating func _protoc_generated_decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
    return try _uniqueStorage().decodeField(setter: &setter, protoFieldNumber: protoFieldNumber)
  }

  public func _protoc_generated_traverse(visitor: inout ProtobufVisitor) throws {
    try _storage.traverse(visitor: &visitor)
  }

  public func _protoc_generated_isEqualTo(other: Stem_Serialize_tensor) -> Bool {
    return _storage === other._storage || _storage.isEqualTo(other: other._storage)
  }

  private mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _storage.copy()
    }
    return _storage
  }
}
