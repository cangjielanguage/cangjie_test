// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Test{
    var length: Int32 = 3
}

let x: Int32  = Test().length

func run(): Int64 {
    if (x == 3) {
        return 0
    }
    return 1

}

func main(): Int64 {
    return run()
}

