// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan StackOverflowError

class Data {
    var a : Int32 = 1
    var b : Int32 = 2
    var c : Data = Data() 
    init() {
        a = 10
        b = 20
        print("yes\n")
    }
}

func run(): Int64 {
    var data: Data = Data()
    return 0
}

func main(): Int64 {
    return run()
}



