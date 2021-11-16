// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C {
    static var a: Int32 = 0
    static func foo() {
        a++ // OK
        a
    }
}

var globalV1 = 0

func countGlobalV1() {
    globalV1++ // OK
    C.a = 99 // OK
    let g = C.foo // OK
}


func main() {
    return 0
}
