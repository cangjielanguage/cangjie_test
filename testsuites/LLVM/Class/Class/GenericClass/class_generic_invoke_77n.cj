// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

class Data<T>{
    let width: T
    init(widthin:T){
        width = widthin
    }
}
func run(): Int64 {
    let data: Data<T> = Data<Int32>(4) //EXPECTED:regex undeclared type name 'T'
    return 0
}

