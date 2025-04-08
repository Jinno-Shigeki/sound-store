//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI
import NoteModel

struct OtherSection: View {
    @Binding var other: Note.Other
    
    var body: some View {
        Section {
            TextEditor(text: $other.description)
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .scrollContentBackground(.hidden)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        } header: {
            Text("その他")
                .font(.title3.bold())
                .padding(.bottom, 4)
        }
    }
}

#Preview {
    @Previewable @State var other: Note.Other = .init(description: "")
    Form {
        OtherSection(other: $other)
    }
}
