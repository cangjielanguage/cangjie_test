// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    let str: T

    Data(x: T){
        str = x
    }
}

func run(): Int64 {
    var str: String = "hello Char lang"
    let data: Data<String> = Data<String>(str)
    var res = data.str
    if (res == str) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

