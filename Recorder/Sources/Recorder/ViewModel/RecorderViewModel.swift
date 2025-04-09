//
//  File.swift
//  Recorder
//
//  Created by 神野成紀 on 2025/04/08.
//

import Foundation
import AVFoundation

@MainActor
@Observable
package final class RecorderViewModel: NSObject, AVAudioRecorderDelegate {
    let fileName: String
    package var isRecording: Bool = false
    
    @ObservationIgnored
    var audioRecorder: AVAudioRecorder?
    
    package init (fileName: String) {
        self.fileName = fileName
    }
    
    package func start() throws {
        if fileName.isEmpty {
            return
        }
        /// fileURL生成
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let url = documentDirectory.appendingPathComponent(fileName)
        /// AVAudioSession有効化
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.playAndRecord, mode: .default)
        try session.setActive(true)
        /// Recorder作成
        let settings : [String : Any] = [
            AVFormatIDKey : Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        let audioRecorder = try AVAudioRecorder(url: url, settings: settings)
        self.audioRecorder = audioRecorder
        audioRecorder.delegate = self
        
        isRecording = true
        audioRecorder.record()
    }
    
    package func stop() {
        audioRecorder?.stop()
        audioRecorder?.delegate = nil
        audioRecorder = nil
        isRecording = false
    }
}
