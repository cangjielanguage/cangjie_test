// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-auto generics type arguments do not match the constraint
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

trait Add<T> {
    func autoInc(left: This, step: T): String
}

enum Time<T>
    where T <: Add<Int32> {
    Day(T)
}

func run(): Int64 {
    var time = Time<Int64>.Day(4)
    var res: String = match (time) {
        case Day(x) => autoInc(x, 2)
    }
    if ( res == "42") {
        return 0
    }
    return 1
}


func main(): Int64 {
    return run()
}
