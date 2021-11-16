package pkgs

external let one : Int32 = 1
external let two : Int32 = 2
external let pi : Float32 = 3.1415

external func foo(){
    let a = one
    let b = two
    let c = pi
    return a + b
}