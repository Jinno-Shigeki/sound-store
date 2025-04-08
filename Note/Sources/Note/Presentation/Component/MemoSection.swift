//
//  SwiftUIView 2.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI
import NoteModel

struct MemoSection: View {
    @Binding var memo: Note.Memo
    
    var body: some View {
        Section {
            TextEditor(text: $memo.description)
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .scrollContentBackground(.hidden)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        } header: {
            Text("メモ")
                .font(.title3.bold())
                .padding(.bottom, 4)
        }
    }
}

#Preview {
    @Previewable @State var memo: Note.Memo = .init(description: "")
    Form {
        MemoSection(memo: $memo)
    }
}
