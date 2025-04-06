//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI

struct EffectorSection: View {
    @Binding var input: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("エフェクター")
                .font(.title2.bold())
            
            TextField("エフェクター名", text: $input)
        }
    }
}

#Preview {
    EffectorSection(input: .constant(""))
}
