//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI
import NoteModel

struct AmpSection: View {
    @Binding var amp: Note.Amp
    
    var body: some View {
        Section {
            TextField("モデル名", text: $amp.name)
            
            VStack(spacing: 4) {
                sliderContent(title: "Gain", value: $amp.gain)
                sliderContent(title: "Volume", value: $amp.volume)
                sliderContent(title: "Master", value: $amp.master)
                sliderContent(title: "Bass", value: $amp.bass)
                sliderContent(title: "Middle", value: $amp.middle)
                sliderContent(title: "Treble", value: $amp.treble)
                sliderContent(title: "Presence", value: $amp.presence)
            }
        } header: {
            Text("アンプ")
                .font(.title3.bold())
                .padding(.bottom, 8)
        }
    }
    
    private func sliderContent(title: String, value: Binding<Double>) -> some View {
        HStack(spacing: 16) {
            Text(title).font(.body)
                .frame(width: 80, alignment: .leading)
            Slider(value: value, in: 0...10, step: 0.1)
            Text(String(format: "%.1f", value.wrappedValue))
        }
    }
}

#Preview {
    @Previewable @State var amp: Note.Amp = .init(name: "")
    Form {
        AmpSection(amp: $amp)
    }
}
