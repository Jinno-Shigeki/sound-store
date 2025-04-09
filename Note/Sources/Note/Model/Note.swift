//
//  File.swift
//  Note
//
//  Created by 神野成紀 on 2025/04/07.
//

import Foundation

/// 音作りに関する記録を表す構造体
package struct Note {
    /// ノートのタイトル
    public var title: String
    /// 使用した楽器の情報
    public var instrument: Instrument
    /// 使用したアンプの設定
    public var amp: Amp
    /// 使用したエフェクターの一覧
    public var effectors: [Effector]
    /// その他の設定情報（例：キャビネットやマイクなど）
    public var other: Other
    /// メモや備考
    public var memo: Memo
    /// ノートの作成日時
    public let createdAt: Date
    /// ノートの最終更新日時
    public let updatedAt: Date

    public init(
        title: String,
        instrument: Instrument = .init(name: ""),
        amp: Amp = .init(name: ""),
        effectors: [Effector] = [],
        other: Other = .init(description: ""),
        memo: Memo = .init(description: ""),
        createdAt: Date = .now,
        updatedAt: Date = .now
    ) {
        self.title = title
        self.instrument = instrument
        self.amp = amp
        self.effectors = effectors
        self.other = other
        self.memo = memo
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension Note {
    /// アンプの設定を表す構造体
    public struct Amp {
        /// モデル名
        public var name: String
        /// ゲイン（歪みの量）
        public var gain: Double
        /// 音量（全体の出力音量）
        public var volume: Double
        /// マスター音量（パワーアンプの音量）
        public var master: Double
        /// 高音域の調整
        public var treble: Double
        /// 中音域の調整
        public var middle: Double
        /// 低音域の調整
        public var bass: Double
        /// プレゼンス（高域の輪郭）
        public var presence: Double

        public init(
            name: String,
            gain: Double = 0,
            volume: Double = 0,
            master: Double = 0,
            treble: Double = 0,
            middle: Double = 0,
            bass: Double = 0,
            presence: Double = 0
        ) {
            self.name = name
            self.gain = gain
            self.volume = volume
            self.master = master
            self.treble = treble
            self.middle = middle
            self.bass = bass
            self.presence = presence
        }
    }

    /// 楽器の設定を表す構造体
    public struct Instrument {
        /// モデル名
        public var name: String
        /// エレキ/アコギ/ベースなど
        public var type: InstrumentType
        /// pickupの位置
        public var pickup: String

        public init(
            name: String,
            type: InstrumentType = .electric,
            pickup: String = "センター"
        ) {
            self.name = name
            self.type = type
            self.pickup = pickup
        }
        
        public enum InstrumentType: String {
            case electric = "エレキギター"
            case acoustic = "アコースティックギター"
            case bass = "ベース"
        }
    }

    /// エフェクターの設定を表す構造体
    public struct Effector: Hashable {
        /// モデル名
        public var name: String
        /// ディストーション、リバーブなど
        public var type: String
        /// 各つまみの名前と値（"Drive": 5.0 など）
        public var settings: [Setting]
        /// 使用順
        public var order: Int

        public init(
            name: String = "",
            type: String = "",
            settings: [Setting] = [],
            order: Int = 0
        ) {
            self.name = name
            self.type = type
            self.settings = settings
            self.order = order
        }
        
        public struct Setting: Hashable {
            public var name: String
            public var value: Double
            
            public init(
                name: String = "",
                value: Double = 0
            ) {
                self.name = name
                self.value = value
            }
        }
        
        public func addSetting(_ setting: Setting) -> Self {
            var updatedSelf = self
            updatedSelf.settings.append(setting)
            return updatedSelf
        }
        
        public func dropLastSetting() -> Self {
            var updatedSelf = self
            guard !updatedSelf.settings.isEmpty else {
                return updatedSelf
            }
            updatedSelf.settings.removeLast()
            return updatedSelf
        }
    }

    /// その他の設定
    public struct Other {
        /// 詳細
        public var description: String

        public init(description: String) {
            self.description = description
        }
    }

    /// メモ
    public struct Memo {
        /// 詳細
        public var description: String

        public init(description: String) {
            self.description = description
        }
    }
}
