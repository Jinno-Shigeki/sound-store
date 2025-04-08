//
//  File.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/08.
//

import Foundation
import NoteModel

@Observable
@MainActor
package final class NoteViewModel {
    public var note: Note
    
    public init() {
        self.note = Note(title: "")
    }
}
