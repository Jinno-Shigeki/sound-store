//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI
import NoteModel

struct EffectorSection: View {
    @Binding var effectors: [Note.Effector]
    
    var body: some View {
        if effectors.isEmpty {
            Section {
                Button {
                    effectors.append(.init())
                } label: {
                    Text("追加")
                }
            } header: {
                Text("エフェクター")
                    .font(.title3.bold())
                    .padding(.bottom, 4)
            }
        }
        
        ForEach(effectors.indices, id: \.self) { index in
            Section {
                TextField("モデル名", text: $effectors[index].name)
                if !$effectors[index].settings.isEmpty {
                    effector(settings: $effectors[index].settings)
                }
            } header: {
                if index == 0 {
                    header()
                }
            } footer: {
                footer(index: index)
            }
        }
        .onDelete { index in
            withAnimation(.easeIn) {
                effectors.remove(atOffsets: index)
            }
        }
    }
    
    private func effector(settings: Binding<[Note.Effector.Setting]>) -> some View {
        VStack {
            ForEach(settings.indices, id: \.self) { index in
                HStack {
                    TextField("value", text: settings[index].name)
                        .frame(width: UIScreen.main.bounds.width / 4)
                    Slider(value: settings[index].value, in: 0...10, step: 0.1)
                    Text(String(format: "%.1f", settings[index].value.wrappedValue))
                }
            }
        }
    }
    
    private func header() -> some View {
        HStack(alignment: .bottom) {
            Text("エフェクター")
                .font(.title3.bold())
            Spacer()
            Button {
                effectors.append(.init())
            } label: {
                Text("追加")
                    .font(.body)
            }
        }
        .padding(.bottom, 8)
    }
    
    private func footer(index: Int) -> some View {
        HStack(alignment: .center) {
            Button {
                effectors[index] = effectors[index].dropLastSetting()
            } label: {
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .opacity(0.8)
            }
            Spacer()
            Button {
                effectors[index] = effectors[index].addSetting(.init(name: "", value: 0))
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .opacity(0.8)
            }
        }
        .padding(.top, 4)
    }
}

#Preview {
    @Previewable @State var effectors: [Note.Effector] = []
    Form {
        EffectorSection(effectors: $effectors)
    }
}
