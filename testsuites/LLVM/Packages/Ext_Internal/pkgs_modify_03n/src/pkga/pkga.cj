package pkga

external let one : Int32 = 1
external let two : Int32 = 2
external let t : ()->Int32 = Test
func Test():Int32{
    let a: Int32 = one
    let b: Int32= two
    return a+b
}


