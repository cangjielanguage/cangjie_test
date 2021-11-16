// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func test(): Int64 {
    var i : Int32 = 1
    match (i) {
        case _ => var j : Int32 = 2
    }
    return 0
}

func main(): Int64 {
    return test()
}
