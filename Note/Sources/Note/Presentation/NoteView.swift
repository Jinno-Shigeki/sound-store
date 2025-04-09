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
                    
                    // ボタン被り対策用の空白
                    Color.clear
                        .frame(height: 100)
                        .listRowBackground(Color.clear)
                }
                .tint(.pink)
                .listSectionSpacing(0)
                .scrollContentBackground(.hidden)
                .background(Color.gray.opacity(0.1))
            }
            
            RecorderView(fileName: "")
                .frame(height: 120)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle("ノート")
        .onDisappear {
            resetColor()
        }
    }
    
    public init() {
        Self.colorSetup()
    }
    
    private static func colorSetup() {
        let appearance = UISegmentedControl.appearance()
        appearance.selectedSegmentTintColor = .white
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.systemPink], for: .selected)
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.systemPink], for: .normal)
    }
    
    private func resetColor() {
        let appearance = UISegmentedControl.appearance()
        appearance.selectedSegmentTintColor = nil
        appearance.setTitleTextAttributes(nil, for: .selected)
        appearance.setTitleTextAttributes(nil, for: .normal)
    }
}

#Preview {
    NavigationStack {
        NoteView()
    }
}
