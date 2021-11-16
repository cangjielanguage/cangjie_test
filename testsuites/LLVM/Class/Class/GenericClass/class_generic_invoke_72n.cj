// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Data<T>{
    let width: T
    let length: T
    init(widthin:T, lengthin: T){
        width = widthin
        length = lengthin
    }
}
func run(): Int64 {
    let data: Data<Int32> = Data(3,4)
    return 0
}

