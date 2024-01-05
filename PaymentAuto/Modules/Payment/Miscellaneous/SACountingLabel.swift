//
//  SACountingLable.swift
//  HiFPTPaymentSDK
//
//  Created by GiaNH3 on 8/2/21.
//

import UIKit
class SACountingLabel: UILabel {
    
    let kCounterRate: Float = 3.0
    
    public enum AnimationType {
        case Linear
        case EaseIn
        case EaseOut
        case EaseInOut
    }
    
    public enum CountingType {
        case Int
        case Float
        case Custom
    }
    
    var start: Float = 0.0
    var end: Float = 0.0
    var timer: Timer?
    var progress: TimeInterval!
    var lastUpdate: TimeInterval!
    var duration: TimeInterval!
    var countingType: CountingType!
    var animationType: AnimationType!
    var currency = "VND"
    
    
    public var format: String?
    
    var currentValue: Float {
        if (progress >= duration) {
            return end
        }
        let percent = Float(progress / duration)
        let update = updateCounter(t: percent)
        return start + (update * (end - start));
    }
    
    public func countFrom(fromValue: Float, to toValue: Float, withDuration duration: TimeInterval, andAnimationType aType: AnimationType, andCountingType cType: CountingType, andCurrency currency: String) {
        
        // Set values
        self.currency = currency
        self.start = fromValue
        self.end = toValue
        self.duration = duration
        self.countingType = cType
        self.animationType = aType
        self.progress = 0.0
        self.lastUpdate = NSDate.timeIntervalSinceReferenceDate
        
        // Invalidate and nullify timer
        killTimer()
        
        // Handle no animation
        if (duration == 0.0) {
            updateText(value: toValue, currency: self.currency)
            return
        }
        
        // Create timer
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateValue), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer!, forMode: .common)
        
    }
    
    func updateText(value: Float, currency: String) {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        switch countingType! {
        case .Int:
            let formatMoney = formatter.string(from: Int(value) as NSNumber)
            self.text = formatMoney! + " " + currency
        case .Float:
            self.text = String(format: "%.1f", value)
        case .Custom:
            if let format = format {
                self.text = String(format: format, value)
            } else {
                self.text = String(format: "%.1f", value)
            }
        }
    }
    
    @objc func updateValue() {
        
        // Update the progress
        let now = Date.timeIntervalSinceReferenceDate
        progress = progress + (now - lastUpdate)
        lastUpdate = now
        
        // End when timer is up
        if (progress >= duration) {
            killTimer()
            progress = duration
        }
        
        updateText(value: currentValue, currency: currency)
        
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateCounter(t: Float) -> Float {
        switch animationType! {
        case .Linear:
            return t
        case .EaseIn:
            return powf(t, kCounterRate)
        case .EaseOut:
            return 1.0 - powf((1.0 - t), kCounterRate)
        case .EaseInOut:
            var t = t
            var sign = 1.0;
            let r = Int(kCounterRate)
            if (r % 2 == 0) {
                sign = -1.0
            }
            t *= 2;
            if (t < 1) {
                return 0.5 * powf(t, kCounterRate)
            } else {
                return Float(sign * 0.5) * (powf(t-2, kCounterRate) + Float(sign * 2))
            }
            
        }
    }
    
}
