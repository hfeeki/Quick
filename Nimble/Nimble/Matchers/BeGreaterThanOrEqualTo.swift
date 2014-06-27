//
//  BeGreaterThanOrEqualTo.swift
//  Nimble
//
//  Created by Bryan Enders on 6/24/14.
//

import Foundation

class BeGreaterThanOrEqualTo: Matcher {
    let _nilMessage = "expected subject not to be nil"
    
    override func failureMessage(actual: NSObject?) -> String {
        return actual
            ? "expected subject to be >= '\(expected)', got '\(actual)'"
            : _nilMessage
    }
    
    override func negativeFailureMessage(actual: NSObject?) -> String {
        return actual
            ? "expected subject not to be >= '\(expected)', got '\(actual)'"
            : _nilMessage
    }
    
    override func match(actual: NSObject?) -> Bool {
        if let actualNumber = actual as? NSNumber {
            if let expectedNumber = expected as? NSNumber {
                let result: NSComparisonResult = actualNumber.compare(expectedNumber)
                return (result == .OrderedDescending || result == .OrderedSame)
            }
        }
        return false
    }
}

extension Prediction {
    @objc(nmb_beGreaterThanOrEqualTo:) func beGreaterThanOrEqualTo(expected: NSObject?) {
        evaluate(BeGreaterThanOrEqualTo(expected))
    }
}