//
//  LZSwiftDelegate.swift
//  LZSwiftDelegate
//
//  Created by Sun Moon on 2020/2/26.
//

import Foundation

public protocol LZSwiftDelegate {

    func onAction(_ event: LZSwiftEvent)
}

public struct LZSwiftEvent {
    public var params: Any?
    public var name: String!

    public init(_ name: String, params: Any?) {
        self.name = name
        self.params = params
    }
}
