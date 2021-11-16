// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex generics type arguments do not match the constraint

record Data<T> {
    let width: T
    init(x: T){
        width = x
    }
}

enum Time<T> where T <: Data<T> {
    Day(T)
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(4)
    var time = Time<Data<Int32>>.Day(data)
    var res: Int32 = match (time) {
        case Day(x) => x.width
    }
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
