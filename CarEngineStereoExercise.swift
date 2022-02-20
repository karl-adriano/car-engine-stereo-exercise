import Foundation

// Concrete Implementation
let ourStereo = KarlStereo()
let ourEngine = DongyiEngine()
let ourCar = Car(stereo: ourStereo, engine: ourEngine)

// Testing Functionality
ourCar.unlockDoors()
ourCar.start()
ourCar.playNextSong()
ourCar.playNextSong()
ourCar.playPreviousSong()
ourCar.pauseMusic()
ourCar.playMusic()
ourCar.stop()
ourCar.lockDoors()


// Protocols/Interfaces
protocol Stereo {
    func turnOn()
    func turnOff()
    func fastForward()
    func playPrevious()
    func pause()
    func play()
}

protocol Engine {
    func start()
    func stop()
}

protocol Drivable {
    func unlockDoors()
    func lockDoors()
    func start()
    func stop()
    func playNextSong()
    func playPreviousSong()
    func pauseMusic()
    func playMusic()
}

// Defining Implementations
class KarlStereo: Stereo {
    var volume: Int = 0
    var songs: [String] = ["Song 1", "Song 2", "Song 3"]
    var index: Int = 0
    var currentSong: String = ""
    var isSongPlaying: Bool = false

    func turnOn() {
        volume = 20
        currentSong = songs[index]
        isSongPlaying = true
        print("Stereo On")
        print("Playing \(currentSong)")
    }

    func turnOff() {
        volume = 0
        isSongPlaying = false
        print("Stereo Off")
    }

    func fastForward() {
        index = index + 1
        if (index > songs.count - 1) {
            index = 0
        }
        currentSong = songs[index]
        isSongPlaying = true
        print("Playing \(currentSong)")
    }

    func playPrevious() {
        index = index - 1
        if (index < 0) {
            index = songs.count - 1
        }
        currentSong = songs[index]
        isSongPlaying = true
        print("Playing \(currentSong)")
    }
    func pause() {
        isSongPlaying = false
        print("Song Paused")
    }

    func play() {
        isSongPlaying = true
        print("Song Resumed")
        print("Playing \(currentSong)")
    }
}

class DongyiEngine: Engine {
    func start() {
        print("Engine Start")
    }

    func stop() {
        print("Engine Stop")
    }
}

class Car: Drivable {
    // TODO
    // innovative safety feature?
    // implement turn signals
    // implement wipers
    // implement lights (headlights, taillights, etc.)
    // implement movement
    // add other functions

    let stereo: Stereo
    let engine: Engine
    private var areDoorsLocked: Bool = false
    private var windowLevel: Int = 100
    private var maxWindowLevel: Int = 100
    private var minWindowLevel: Int = 0
    
    init(stereo: Stereo, engine: Engine) {
        self.stereo = stereo
        self.engine = engine
    }
    
    func unlockDoors() {
        areDoorsLocked = false
        print("Doors are unlocked")
    }

    func lockDoors() {
        areDoorsLocked = true
        print("Doors are locked")
    }

    // TODO: add function to control which windows are moved
    func rollWindowUp() {
        if (windowLevel < maxWindowLevel) {
            windowLevel = windowLevel + 1
        }
    }

    func rollWindowDown() {
        if (windowLevel > maxWindowLevel) {
            windowLevel = windowLevel - 1
        }
    }

    func start() {
        engine.start()
        stereo.turnOn()
    }
    
    func stop() {
        stereo.turnOff()
        engine.stop()
    }

    func playNextSong() {
        stereo.fastForward()
    }

    func playPreviousSong() {
        stereo.playPrevious()
    }

    func pauseMusic() {
        stereo.pause()
    }

    func playMusic() {
        stereo.play()
    }
}