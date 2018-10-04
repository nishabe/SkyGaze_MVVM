//
//  XCTestCase.swift
//  SkyGazeTests
//
//  Created by Abraham, Aneesh on 9/19/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import XCTest

extension XCTestCase {
    func loadStubFromFile (name: String , extension: String) -> Data {
        let bundle = Bundle (for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        return try! Data(contentsOf: url!)
    }
}
