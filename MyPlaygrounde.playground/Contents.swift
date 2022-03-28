import Foundation

class Car{
    var color="Red"
    
    static let singetonCar = Car()
}

let myCar = Car.singetonCar
myCar.color="Blue"
print(myCar.color)

let urCar = Car.singetonCar
print(urCar.color)

class A{
    init(){
        Car.singetonCar.color="Brown"
    }
}

class B{
    init(){
        print(Car.singetonCar.color)
    }
}

let a = A()
let b = B()

