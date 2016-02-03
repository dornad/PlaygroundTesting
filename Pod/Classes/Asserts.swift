// This source file is part of the PROJECT_NAME open source project
//
// Copyright (c) 2016 Daniel Rodriguez
// Licensed under LICENSE
//
// See LICENSE_FILE_URL for license information
//
// ATTRIBUTION_IDEA_SWIFT.ORG_TEXT
//
//
//  Asserts.swift
//
import Foundation

private let defaultMessage = ""

public func XCTAssert(@autoclosure expression: () -> BooleanType, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression(), message: message)
}

public func XCTAssertEqual<T : Equatable>(@autoclosure expression1: () -> T?, @autoclosure _ expression2: () -> T?, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: message)
}

public func XCTAssertEqual<T : Equatable>(@autoclosure expression1: () -> ArraySlice<T>, @autoclosure _ expression2: () -> ArraySlice<T>, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: message)
}

public func XCTAssertEqual<T : Equatable>(@autoclosure expression1: () -> ContiguousArray<T>, @autoclosure _ expression2: () -> ContiguousArray<T>, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: message)
}

public func XCTAssertEqual<T : Equatable>(@autoclosure expression1: () -> [T], @autoclosure _ expression2: () -> [T], _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: message)
}

public func XCTAssertEqual<T, U : Equatable>(@autoclosure expression1: () -> [T : U], @autoclosure _ expression2: () -> [T : U], _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: message)
}

public func XCTAssertFalse(@autoclosure expression: () -> BooleanType, _ message: String = defaultMessage) -> String {
    return returnTestResult(!expression().boolValue, message: message)
}

public func XCTAssertGreaterThan<T : Comparable>(@autoclosure expression1: () -> T, @autoclosure _ expression2: () -> T, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() > expression2(), message: message)
}

public func XCTAssertGreaterThanOrEqual<T : Comparable>(@autoclosure expression1: () -> T, @autoclosure _ expression2: () -> T, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() >= expression2(), message: message)
}

public func XCTAssertLessThan<T : Comparable>(@autoclosure expression1: () -> T, @autoclosure _ expression2: () -> T, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() < expression2(), message: message)
}

public func XCTAssertLessThanOrEqual<T : Comparable>(@autoclosure expression1: () -> T, @autoclosure _ expression2: () -> T, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() <= expression2(), message: message)
}

public func XCTAssertNil(@autoclosure expression: () -> Any?, _ message: String = "") -> String {
    var result = true
    if let _ = expression() {
        result = false
    }
    return returnTestResult(result, message: message)
}

public func XCTAssertNotEqual<T : Equatable>(@autoclosure expression1: () -> T?, @autoclosure _ expression2: () -> T?, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: message)
}

public func XCTAssertNotEqual<T : Equatable>(@autoclosure expression1: () -> ContiguousArray<T>, @autoclosure _ expression2: () -> ContiguousArray<T>, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: message)
}

public func XCTAssertNotEqual<T : Equatable>(@autoclosure expression1: () -> ArraySlice<T>, @autoclosure _ expression2: () -> ArraySlice<T>, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: message)
}

public func XCTAssertNotEqual<T : Equatable>(@autoclosure expression1: () -> [T], @autoclosure _ expression2: () -> [T], _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: message)
}

public func XCTAssertNotEqual<T, U : Equatable>(@autoclosure expression1: () -> [T : U], @autoclosure _ expression2: () -> [T : U], _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: message)
}

public func XCTAssertNotNil(@autoclosure expression: () -> Any?, _ message: String = "") -> String {
    var result = false
    if let _ = expression() {
        result = true
    }
    return returnTestResult(result, message: message)
}

public func XCTAssertTrue(@autoclosure expression: () -> BooleanType, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression(), message: message)
}

public func XCTFail(message: String = "") -> String {
    return failMessage(message)
}

/**
Check that an expression throws an `ErrorType`, with the option to check the error.

This is a custom version of `XCTAssertThrowsError`, which is under development and will (possibly) be released with Swift 3.0

- seealso: [XCTAssertThrowsError (github.com)](https://github.com/apple/swift-corelibs-xctest/blob/master/Sources/XCTest/XCTAssert.swift#L388)
- seealso: [Proposal: XCTest Support for Swift Error Handling (Mailing List)](https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20160104/006188.html)
*/
public func XCTAssertThrowsError<T>(@autoclosure expression: () throws -> T, _ message: String = defaultMessage, _ errorHandler: (error: ErrorType) -> Void = { _ in }) -> String {

    var caughtErrorOptional: ErrorType?
    do {
        _ = try expression()
    }
    catch {
        caughtErrorOptional = error
    }

    if let caughtError = caughtErrorOptional {
        errorHandler(error: caughtError)
        return returnTestResult(true, message:message)
    } else {
        return returnTestResult(false, message:message)        
    }
}


func returnTestResult(result: BooleanType, message: String) -> String {
    if result {
        return okMessage()
    }
    return failMessage(message)
}

func okMessage() -> String {
    return "✅"
}

func failMessage(message: String) -> String {
    return "❌" + message
}