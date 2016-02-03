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
//  TestCaseProvider.swift
//  Protocol for classes that can provide test cases
//
import Foundation

public typealias Test = (String, () throws -> Void)

public protocol TestCaseProvider {

	var allTests: [Test] { get }
}