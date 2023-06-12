//
//  VIew+Extension.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    public func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
