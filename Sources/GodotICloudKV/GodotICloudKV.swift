import SwiftGodotRuntime

private func makeGodotApplePluginsICloudKVTypes() -> [ExtensionInitializationLevel: [Object.Type]] {
    do {
        return try [
            ICloudKV.self,
        ].prepareForRegistration()
    } catch {
        fatalError("Failed to prepare ICloudKV registrations: \(error)")
    }
}

private let godotApplePluginsICloudKVTypes = makeGodotApplePluginsICloudKVTypes()

public let godotApplePluginsICloudKVMinimumInitializationLevel = minimumInitializationLevel(
    for: godotApplePluginsICloudKVTypes
)

public func godotApplePluginsICloudKVInitialize(level: ExtensionInitializationLevel) {
    godotApplePluginsICloudKVTypes[level]?.forEach(register)
}

public func godotApplePluginsICloudKVDeinitialize(level: ExtensionInitializationLevel) {
    godotApplePluginsICloudKVTypes[level]?.reversed().forEach(unregister)
}

@_cdecl("godot_apple_plugins_icloud_kv_start")
public func godotApplePluginsICloudKVStart(interface: OpaquePointer?, library: OpaquePointer?, extension: OpaquePointer?) -> UInt8 {
    guard let interface, let library, let `extension` else {
        print("Error: Not all parameters were initialized.")
        return 0
    }

    initializeSwiftModule(
        interface,
        library,
        `extension`,
        initHook: godotApplePluginsICloudKVInitialize,
        deInitHook: godotApplePluginsICloudKVDeinitialize,
        minimumInitializationLevel: godotApplePluginsICloudKVMinimumInitializationLevel
    )
    return 1
}
