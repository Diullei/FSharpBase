///asdalskdj
let helloWorld = 
    "Hello world from FSI"

printfn "%s" helloWorld


/// A class for representing (x,y) coordinates 
type IPoint = 
    /// Computes the distance between this point and another 
    member DistanceTo : otherPoint:Point -> float  