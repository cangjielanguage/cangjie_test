// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

trait Add<T> {
    func autoInc(left: This, step: T): String
}

append Int64 with Add<Int32> {
    func autoInc(left: Int64, step: Int32): String{
        return left.toString() + step.toString()
    }
}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var i: Int64 = 4
    var time = Time.Day(i)
    var res: String = match (time) {
        case Day(x) => autoInc(x, 2) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    }
    if ( res == "42") {
        return 0
    }
    return 1
}


func main(): Int64 {
    return run()
}
