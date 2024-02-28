//
//  Haptic.swift
//  
//
//  Created by Jevon Mao on 3/4/21.
//
#if canImport(UIKit)
import Foundation
import UIKit

@available(tvOS, unavailable)
class HapticsManager {
    var notificationFeedbackGenerator: UINotificationFeedbackGenerator?
    init() {
        notificationFeedbackGenerator = UINotificationFeedbackGenerator()
        notificationFeedbackGenerator?.prepare()
    }
    func notificationImpact(_ type: UINotificationFeedbackGenerator.FeedbackType){
        notificationFeedbackGenerator?.notificationOccurred(type)
        notificationFeedbackGenerator = nil
    }
}
#endif
