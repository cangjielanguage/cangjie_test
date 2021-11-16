// DEPENDENCE: pkga
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args


import pkga.Coo

func main(): Int64 {
    var i: Int32 = 3
    var res: Int32 = Coo<String>.foo<Int32>(i)
    if(res == 3){
        return 0
    }
    return 1
}
