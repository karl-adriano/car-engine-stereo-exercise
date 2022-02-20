import Foundation

// Concrete Implementation
let ourStereo = KarlStereo()
let ourEngine = DongyiEngine()
let ourCar = Car(stereo: ourStereo, engine: ourEngine)

// Testing Functionality
ourCar.unlockDoors()
ourCar.start()
ourCar.buckleUp()
ourCar.unbuckle()
ourCar.changeGearToDrive()
ourCar.changeGearToNeutral()
ourCar.changeGearToReverse()
ourCar.changeGearToPark()
ourCar.turnOnLeftTurnSignal()
ourCar.turnOnRightTurnSignal()
ourCar.turnOnFogSafetyFeature()
ourCar.useHighHeadlights()
ourCar.useFastWipers()
ourCar.turnOffHeadlights()
ourCar.turnOffWipers()
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
    let stereo: Stereo
    let engine: Engine
    private var areDoorsLocked: Bool = false
    private var shift: String = "park"
    private var isBuckled: Bool = false
    private var isLeftBlinkerOn: Bool = false
    private var isRightBlinkerOn: Bool = false
    private var wiperSpeed: String = "off"
    private var headlightBrightness: String = "off"
    private var isFoggy: Bool = true
    private var isFrontWindowHeatingOn: Bool = false

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
    
    func start() {
        engine.start()
        stereo.turnOn()
    }
    
    func stop() {
        stereo.turnOff()
        engine.stop()
    }

    func buckleUp() {
        isBuckled = true
        print("Buckled Up")
    }

    func unbuckle() {
        isBuckled = false
        print("Unbuckled")
    }

    func changeGearToPark() {
        shift = "park"
        print("Shift Position: \(shift)")
    }

    func changeGearToReverse() {
        shift = "reverse"
        print("Shift Position: \(shift)")
    }

    func changeGearToNeutral() {
        shift = "neutral"
        print("Shift Position: \(shift)")
    }

    func changeGearToDrive() {
        shift = "drive"
        print("Shift Position: \(shift)")
    }

    func turnOnLeftTurnSignal() {
        isRightBlinkerOn = false
        isLeftBlinkerOn = true
        print("Left Blinker is on")
    }

    func turnOnRightTurnSignal() {
        isLeftBlinkerOn = false
        isRightBlinkerOn = true
        print("Right Blinker is on")
    }

    func turnOffWipers() {
        wiperSpeed = "off"
        print("Wiper Speed: \(wiperSpeed)")
    }

    func useSlowWipers() {
        wiperSpeed = "slow"
        print("Wiper Speed: \(wiperSpeed)")
    }

    func useMediumWipers() {
        wiperSpeed = "medium"
        print("Wiper Speed: \(wiperSpeed)")
    }

    func useFastWipers() {
        wiperSpeed = "fast"
        print("Wiper Speed: \(wiperSpeed)")
    }

    func turnOffHeadlights() {
        headlightBrightness = "off"
        print("Headlight Brightness: \(headlightBrightness)")
    }

    func useLowHeadlights() {
        headlightBrightness = "low"
        print("Headlight Brightness: \(headlightBrightness)")
    }

    func useHighHeadlights() {
        headlightBrightness = "high"
        print("Headlight Brightness: \(headlightBrightness)")
    }

    func turnOnFogSafetyFeature() {
        if isFoggy {
            isFrontWindowHeatingOn = true
            useHighHeadlights()
        }
        else {
            isFrontWindowHeatingOn = false
        }
        print("Is there window heating: \(isFrontWindowHeatingOn)")
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