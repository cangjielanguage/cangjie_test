// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal record GenRec1{
    static let b: Int32 = GenRec2.foo()
    static func foo(): Int32 {
        return 3
    }
}

external record GenRec2{
    static let b: Int32 = GenRec1.foo()
    static func foo(): Int32 {
        return 4
    }
}

func main():Int64 {
    var res1 = GenRec1.b
    var res2 = GenRec2.b
    if (res1 == 4 && res2 ==3) {
        return 0
    }
    return 1
}