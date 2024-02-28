//
//  File.swift
//
//
//  Created by Jevon Mao on 1/31/21.
//

import Foundation
import UserNotifications
import CorePermissionsSwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


@available(iOS 13.0, macOS 12.0, tvOS 13.0, *)
public extension PermissionManager {
    ///The `notification` permission allows the iOS system to receive notification from app
    static let notification = JMNotificationPermissionManager()
}

@available(iOS 13.0, macOS 12.0, tvOS 13.0, *)
public final class JMNotificationPermissionManager: PermissionManager {
    
    
    public override var permissionType: PermissionType {
        .notification
    }
    
    public override var authorizationStatus: AuthorizationStatus {
        var notificationSettings: UNNotificationSettings?
        let semaphore = DispatchSemaphore(value: 0)
        
        DispatchQueue.global().async {
            self.notificationManager.getNotificationSettings { settings in
                notificationSettings = settings
                semaphore.signal()
            }
        }

        semaphore.wait()
        guard let settings = notificationSettings else{
            #if DEBUG
            print("Notification settings is nil while getting authorization status for JMNotificationPermissionManager")
            #endif
            return .notDetermined
        }
        switch settings.authorizationStatus{
        case .authorized:
            return .authorized
        case .denied:
            return .denied
        case .notDetermined:
            return .notDetermined
        case .provisional:
            return .limited
        default:
            return .denied
        }
    }
    var notificationManager = UNUserNotificationCenter.current()

    override public func requestPermission(completion: @escaping (Bool, Error?) -> Void) {
        notificationManager.requestAuthorization(options: [.badge,.alert,.sound]){ granted, error in
            completion(granted, error)
        }
        #if os(iOS)
        UIApplication.shared.registerForRemoteNotifications()
        #elseif os(macOS)
        NSApplication.shared.registerForRemoteNotifications()
        #endif
    }
}
