//
//  GPTextField.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import SwiftUI

struct GPTextField: View {
    @Binding var text: String

    var body: some View {
        ZStack {
            TextField("GPTextField", text: $text, prompt: Text("Please Enter your Summoner Name."))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .onAppear(perform: {
                    UITextField.appearance().clearButtonMode = .whileEditing
                })
                .padding(.horizontal, 16)
        }
        .frame(
            minWidth: 300,
            idealWidth: 300,
            maxWidth: 500,
            minHeight: 52,
            alignment: .center
        )
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
    }
}

#Preview {
    @State var text: String = ""

    return GPTextField(text: $text)
}
