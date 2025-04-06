//
//  ContentView.swift
//  sound-store
//
//  Created by 神野成紀 on 2024/12/12.
//

import SwiftUI
import SwiftData
import NotePresentation

public struct RootView: View {

    public var body: some View {
        NavigationStack {
            Text("first view")
            NoteView()
        }
    }
    
    public init() {}
}

#Preview {
    RootView()
}
