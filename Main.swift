print("Making balloon1")
var balloon1 = Balloon(xPosition: 80, yPosition: 14, id: 1)
print("Making spike")
var spike = Spike(positionX: 30)
print(outputB(balloon1))
print(outputS(spike))
print("Moving balloon1 to (80, 0)")
balloon1.moveBalloon(xChange: 80, yChange: 0) 
print(outputB(balloon1))
print("Moving spike to (80, 0)")
spike.moveSpike(newX: 80)
print(outputS(spike))
spike.popBalloon(balloon1)
print(outputB(balloon1))

// function decides what to output to the console
func outputB(_ balloon: Balloon) -> String {
    return (balloon.popped) ? "The balloon is popped" : "Balloon's values: x: \(balloon.xPosition!) | y: \(balloon.yPosition!) | id: \(balloon.id!) | Popped? \(balloon.popped!)"
}
//Creating the string to output
func outputS(_ spike: Spike) -> String {
    return "Spike's coordinates are (\(spike.positionX!), 0)"
}

// This is the balloon class
class Balloon {
    // creating the fields
    var id: Int!
    var xPosition: Int!
    var yPosition: Int!
    var popped: Bool!
    // initializer for the balloon
    init(xPosition: Int, yPosition: Int, id: Int) {
        self.xPosition = xPosition
        self.yPosition = yPosition
        self.id = id
        popped = false
    }
    // Method moves the balloon's coordinates
    func moveBalloon(xChange: Int, yChange: Int) {
        self.xPosition = xChange
        self.yPosition = yChange
    }
}
// Spike class
class Spike {
    // creating the fields
    var positionX: Int!
    let positionY: Int = 0
    // initializer for the spike
    init (positionX: Int) {
        self.positionX = positionX
    }
    // method that checks to see if the balloon can be popped
    func popBalloon(_ balloon: Balloon) {
        if (balloon.xPosition == self.positionX && balloon.yPosition == positionY ) {
            balloon.popped = true
        }
    }
    // method that moves the spike
    func moveSpike(newX: Int) {
        self.positionX = newX
    }
}