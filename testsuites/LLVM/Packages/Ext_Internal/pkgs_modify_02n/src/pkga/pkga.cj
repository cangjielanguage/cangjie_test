package pkga

external let one : Int32 = 1
external let two : Int32 = 2
external let t : Test = Test()
external class Test{
    let a: Int32 = one
    let b: Int32= two
}


