//
//  Storable.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

public protocol Storable {
    associatedtype DTO = DataTransferObject
    init(dto: DTO)
    func dto() -> DTO
}

public protocol DataTransferObject {
    
}
