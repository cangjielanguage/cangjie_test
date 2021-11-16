// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    let width: T

    Data(x: T){
        width = x
    }
}

func run(): Int64 {
    var SetWidth: Set<Int32> = #{1,2,3,4,5,6,1}
    let data: Data<Set<Int32>> = Data<Set<Int32>>(SetWidth)
    var res = data.width
    if (res == SetWidth) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

