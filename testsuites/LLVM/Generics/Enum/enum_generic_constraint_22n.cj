// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex generics type arguments do not match the constraint

enum Date<T> { Day(T) }

enum Time<T> where T<: Date<T> {
    Day(T)
}

func run(): Int64 {
    var date: Date<String> = Date<String>.Day("enum")
    var time: Time<Date<String>> = Time<Date<String>>.Day(date)
    var res: String = match (time) {
        case Day(x) => match (x) { case Day(x) => x+"!"}
    }
    if (res == "enum!") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
