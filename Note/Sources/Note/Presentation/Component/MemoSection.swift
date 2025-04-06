//
//  SwiftUIView 2.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI

struct MemoSection: View {
    @Binding var input: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("メモ")
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
    MemoSection(input: .constant("MEMO"))
}
