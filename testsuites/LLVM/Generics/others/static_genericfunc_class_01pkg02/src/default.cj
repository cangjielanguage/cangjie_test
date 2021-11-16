// DEPENDENCE: pkga
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args


import pkga.res

func main(): Int64 {
    if(res == 3){
        return 0
    }
    return 1
}
