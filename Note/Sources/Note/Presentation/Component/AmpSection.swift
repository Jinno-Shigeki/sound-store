//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI

struct AmpSection: View {
    @Binding var input: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("アンプ")
                .font(.title2.bold())
            
            TextField("アンプ名", text: $input)
        }
    }
}

#Preview {
    AmpSection(input: .constant(""))
}
