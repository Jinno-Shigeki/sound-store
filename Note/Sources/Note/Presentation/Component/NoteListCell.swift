//
//  SwiftUIView.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/07.
//

import SwiftUI

struct NoteListCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray)
                    .frame(width: 120, height: 100)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("タイトル")
                        .font(.headline)
                        .lineLimit(2)
                    Text("Gear :")
                        .font(.caption)
                        .lineLimit(1)
                    Text("Amp :")
                        .font(.caption)
                        .lineLimit(1)
                    Text("FX :")
                        .font(.caption)
                        .lineLimit(2)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .frame(height: 100)
                    .alignmentGuide(VerticalAlignment.center) { d in
                        d[VerticalAlignment.center]
                    }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            
            Divider()
        }
    }
}

#Preview {
    VStack {
        NoteListCell()
    }
    .background(Color.gray.opacity(0.1))
}
