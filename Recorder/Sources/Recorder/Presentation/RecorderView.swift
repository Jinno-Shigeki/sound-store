//
//  SwiftUIView.swift
//  Recorder
//
//  Created by 神野成紀 on 2025/04/09.
//

import SwiftUI
import RecorderViewModel

public struct RecorderView: View {
    @State private var viewModel: RecorderViewModel
    
    public var body: some View {
        VStack(alignment: .center) {
            Button {
                do {
                    viewModel.isRecording ? viewModel.stop() : try viewModel.start()
                } catch {
                    
                }
            } label: {
                ZStack {
                    Image(systemName: "circle")
                        .resizable()
                        .foregroundStyle(.white.opacity(0.9))
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: "app.fill")
                        .resizable()
                        .foregroundStyle(.red)
                        .frame(width: 40, height: 40)
                        .opacity(viewModel.isRecording ? 1 : 0)
                        .animation(.easeIn.delay(0.2), value: viewModel.isRecording)
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundStyle(.red)
                        .frame(width: 60, height: 60)
                        .opacity(viewModel.isRecording ? 0 : 1)
                        .animation(.easeIn.delay(0.1), value: viewModel.isRecording)
                }
            }
            .tint(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.primary.opacity(0.7))
    }
    
    public init(fileName: String) {
        self.viewModel = RecorderViewModel(fileName: fileName)
    }
}

#Preview {
    RecorderView(fileName: "a")
}
