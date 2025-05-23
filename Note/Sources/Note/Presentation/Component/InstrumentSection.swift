//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI
import NoteModel

struct InstrumentSection: View {
    @Binding var instrument: Note.Instrument
    
    var body: some View {
        Section {
            TextField("モデル名", text: $instrument.name)
            
            Picker(selection: $instrument.type) {
                Text("アコースティックギター").tag(Note.Instrument.InstrumentType.acoustic)
                Text("エレキギター").tag(Note.Instrument.InstrumentType.electric)
                Text("ベース").tag(Note.Instrument.InstrumentType.bass)
            } label: {
                Text("種類")
            }
            .pickerStyle(.automatic)
            
            Picker("ピックアップ", selection: $instrument.pickup) {
                Text("フロント").tag("フロント")
                Text("センター").tag("センター")
                Text("リア").tag("リア")
            }
            .pickerStyle(.segmented)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.vertical, 4)
        } header: {
            Text("楽器")
                .font(.title3.bold())
                .padding(.bottom, 4)
        }
    }
    
    init(instrument: Binding<Note.Instrument>) {
        self._instrument = instrument
    }
}

#Preview {
    @Previewable @State var instrument: Note.Instrument = .init(name: "")
    Form {
        InstrumentSection(instrument: $instrument)
    }
}
