// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a: Int32 = 1

    func foo() {
        return a
    }

    var ret = foo()

    if ( ret != 1 ){
        return 1
    }

    return 0
}