//
//  CGPointExtension.swift
//  ZombieConga
//
//  Created by Quoc Nguyen on 12/14/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }

    func normalized() -> CGPoint {
        return self / length()
    }

    var angle: CGFloat {
        return atan2(y, x)
    }

    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }

    static func += (left: inout CGPoint, right: CGPoint) {
        left = left + right
    }

    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }

    static func -= (left: inout CGPoint, right: CGPoint) {
        left = left - right
    }

    static func * (left: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: left.x * right, y: left.y * right)
    }

    static func *= (left: inout CGPoint, right: CGFloat) {
        left = left * right
    }

    static func / (left: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: left.x / right, y: left.y / right)
    }

    static func /= (left: inout CGPoint, right: CGFloat) {
        left = left / right
    }

}
