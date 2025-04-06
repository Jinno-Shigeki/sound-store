//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI

public struct NoteView: View {
    @State private var title = ""
    @State var instrument = ""
    @State var amp = ""
    @State var effector = ""
    @State var other = ""
    @State var memo = ""
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(spacing: 0) {
                    TextField("タイトル", text: $title)
                        .font(.title.bold())
                    Divider()
                        .background(.black)
                }
                .padding(.horizontal, 16)
                
                VStack(alignment: .leading) {
                    InstrumentSection(input: $instrument)
                    AmpSection(input: $amp)
                    EffectorSection(input: $effector)
                    OtherSection(input: $other)
                    MemoSection(input: $memo)
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle("ノート")
    }
    
    public init() {
        
    }
    
    private func section(_ name: String) -> some View {
        Text(name)
            .font(.title2.bold())
    }
}

#Preview {
    NavigationStack {
        NoteView()
    }
}
