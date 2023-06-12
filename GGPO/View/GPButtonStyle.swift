//
//  ConfirmButton.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import SwiftUI

struct GPButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foreGroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(
                minWidth: 300,
                idealWidth: 300,
                maxWidth: 500,
                minHeight: 52,
                alignment: .center
            )
            .font(.system(size: 24, weight: .black))
            .background(configuration.isPressed ? self.backgroundColor.opacity(0.7) : self.backgroundColor)
            .foregroundStyle(self.foreGroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct ConfirmButton: View {
    var body: some View {
        Button("Start") {

        }
        .buttonStyle(GPButtonStyle(backgroundColor: .black, foreGroundColor: .white))
    }
}

#Preview {
    ConfirmButton()
}
