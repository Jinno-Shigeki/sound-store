//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI
import NoteViewModel
import RecorderPresentation

public struct NoteView: View {
    @State var viewModel: NoteViewModel = NoteViewModel()
    @State private var title = ""
    @State var amp = ""
    @State var effector = ""
    @State var other = ""
    @State var memo = ""
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Form {
                    Section {
                        VStack(spacing: 0) {
                            TextField("タイトル", text: $viewModel.note.title)
                                .font(.body)
                        }
                    } header: {
                        Text("タイトル")
                            .font(.title2.bold())
                            .padding(.bottom, 4)
                    }

                    InstrumentSection(instrument: $viewModel.note.instrument)
                    AmpSection(amp: $viewModel.note.amp)
                    EffectorSection(effectors: $viewModel.note.effectors)
                    OtherSection(other: $viewModel.note.other)
                    MemoSection(memo: $viewModel.note.memo)
                }
                .scrollContentBackground(.hidden)
                .background(Color.gray.opacity(0.1))
                .navigationTitle("ノート")
            }
            
            RecorderView(fileName: "")
        }
    }
    
    public init() {
        
    }
}

#Preview {
    NavigationStack {
        NoteView()
    }
}
