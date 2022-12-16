/*
  url: https://www.tutorialspoint.com/design_pattern/adapter_pattern.htm
 */

import Foundation

// Mark Enumeration
enum audioType {
case vlc, mp4
}

// MARK: Protocols
protocol MediaPlayer {
    static func play(_ type: audioType)
}

protocol AdvancedMediaPlayer {
    static func playVlc()
    static func playMp4()
}

// MARK: Advanced Media Player Implementation
struct VlcPlayer : AdvancedMediaPlayer {
    static func playVlc() {
        print("Playing vlc")
    }
    
    static func playMp4() {
        // do nothing
    }
}

struct Mp4Player : AdvancedMediaPlayer {
    static func playVlc() {
        // do nothing
    }
    
    static func playMp4() {
        print("Playing Mp4")
    }
}

// MARK: Pattern Implementation

struct MediaAdapter : MediaPlayer {
    
    var advancedMediaPlayer : AdvancedMediaPlayer
    
    static func play(_ type: audioType) {
        switch type {
        case .vlc: VlcPlayer.playVlc()
        case .mp4: Mp4Player.playMp4()
        }
    }
    
}

// MARK: Media Player Implementation
struct AudioPlayer: MediaPlayer {
    
    static func play(_ type: audioType) {
        MediaAdapter.play(type)
    }
    
}


// MARK: Main Demo
AudioPlayer.play(.vlc)
AudioPlayer.play(.mp4)
