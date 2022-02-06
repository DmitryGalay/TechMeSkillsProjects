//
//  SharedStorageTest.swift
//  Weather_AppViperTests
//
//  Created by Dima on 6.02.22.
//

import XCTest
@testable import Weather_AppViper

class SharedStorageTest: XCTestCase {

    let service = SharedStorageImp.shared
    
    func testShared() {
        let key = "Key"
        guard let value = Data(base64Encoded: "Any") else {return}
        service.setValue(key: key, value: value)
        let storageValue: Data? = service.getValue(key: key)
        XCTAssertEqual(storageValue, value)
    }
}
