// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a: Int32 = 1

    var ret = {return a}()

    if ( ret != 1 ){
        return 1
    }

    return 0
}