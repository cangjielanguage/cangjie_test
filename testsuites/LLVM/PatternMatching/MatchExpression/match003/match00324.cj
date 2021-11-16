// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func test(): Int64 {
    var i : Int32 = 1
    match (i) {
        case _ => func myFunc():Int32{1}
    }
    return 0
}

func main(): Int64 {
    return test()
}
