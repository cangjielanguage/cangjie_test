// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Base {
    static let a: Base = Base()
    var b = a // EXPECTED: regex 'a' is used before initialization
    var c: Int64 = 5
}

func run(): Int64 {
    if( Base.a.b.c == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}