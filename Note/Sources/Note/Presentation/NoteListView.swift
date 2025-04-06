//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/07.
//

import SwiftUI

public struct NoteListView: View {
    @State var items: [String] = ["a", "b", "c"]
    
    public var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(items, id: \.self) { _ in
                    Button {
                        
                    } label: {
                        NoteListCell()
                    }
                    .tint(Color.primary)
                }
            }
            .navigationTitle("ノート一覧")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .tint(Color.primary)
                }
            }
        }
    }
    
    public init() {
        
    }
}

#Preview {
    NoteListView()
}
