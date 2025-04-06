//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/06.
//

import SwiftUI

struct InstrumentSection: View {
    @Binding var input: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("楽器")
                .font(.title2.bold())
            
            TextField("楽器名", text: $input)
        }
    }
}

#Preview {
    InstrumentSection(input: .constant(""))
}
