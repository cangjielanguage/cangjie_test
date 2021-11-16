// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Int8>([1,2,3])

func main(): Int64 {

    if(a1[0]!=1 || a1[1]!=2 || a1[2]!=3 ){
        return 1
    }

    return 0
}
