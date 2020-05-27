//
//  SpeedUpPlayer.swift
//  RepeatSpeedUpApp
//
//  Created by kassergey on 26.04.2020.
//  Copyright © 2020 kassergey. All rights reserved.
//

import AVFoundation


class SpeedUpPlayer: NSObject {
    
    private var player: AVAudioPlayer?
    var filePath: String? {
        didSet {
            player = nil
        }
    }
    
    private(set) var rate: Float = 1.0
    var initialRate: Float = 1.5
    var speedUpRate: Float = 0.5
    
    static let shared = SpeedUpPlayer()
    
    func play() {
        guard let filePath = filePath else {
            return
        }
        if player != nil {
            player?.play()
            return
        }
        player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath))
        player?.delegate = self
        rate = initialRate
        player?.enableRate = true
        player?.rate = self.rate
        player?.play()
        player?.setVolume(20, fadeDuration: 0)
    }
    
    func pause() {
        player?.pause()
    }
    
    func isPaused() -> Bool {
        return player?.isPlaying != nil
    }
    
    func stop() {
        player = nil
    }

}

extension SpeedUpPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.enableRate = true
        rate += speedUpRate
        player.rate = rate
        player.play()
    }
}
