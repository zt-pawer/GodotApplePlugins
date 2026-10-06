//
//  ICloudKV.swift
//  GodotApplePlugins
//

import Foundation
import SwiftGodotRuntime

@Godot
class ICloudKV: RefCounted, @unchecked Sendable {
    @Callable
    func get_value(_ key: String) -> String {
        NSUbiquitousKeyValueStore.default.string(forKey: key) ?? ""
    }

    @Callable
    func set_value(_ key: String, _ value: String) -> Bool {
        NSUbiquitousKeyValueStore.default.set(value, forKey: key)
        return NSUbiquitousKeyValueStore.default.synchronize()
    }
}
