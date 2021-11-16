// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<List<Char>>([['c','d'],['a','b']])

a1.sort()

func main(): Int64 {
    
    if(a1[0][0]!='a' || a1[0][1]!='b' || a1[1][0]!='c' || a1[1][1]!='d'){
        return 1
    }

    return 0
}
