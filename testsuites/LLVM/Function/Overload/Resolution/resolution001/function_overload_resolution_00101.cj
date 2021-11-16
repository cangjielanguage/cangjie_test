// DEPENDENCE: a importcfg
// EXEC: %compiler %cmp_opt -c ./a/a.cj -o a.%middle && %copycharjs a
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// EXEC: %run %run_opt %output %run_args


import a.*
func test(a:Int16):Int64{return 2}

func main(){
    if (test(1) == 2) {
        return 0
    }
    return 1
}


