package pkga

external let one : Int32 = 1
external let two : Int32 = 2
external let t : Int32 = test()
func test():Int32{
    let a = one
    let b = two
    return a + b
}


