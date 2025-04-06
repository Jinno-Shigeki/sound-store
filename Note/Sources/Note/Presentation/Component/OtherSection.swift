//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI

struct OtherSection: View {
    @Binding var input: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("その他")
                .font(.title2.bold())
            
            TextEditor(text: $input)
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .scrollContentBackground(.hidden)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    OtherSection(input: .constant("aaa"))
}
