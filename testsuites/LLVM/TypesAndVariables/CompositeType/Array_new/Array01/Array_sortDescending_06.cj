// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<List<Char>>([['b','f','a'],['d','a','c']])

a1.sortDescending()
a1[0].sortDescending()
a1[1].sortDescending()

func main(): Int64 {
    
    if(a1[0][0]=='f' && a1.get(0)[1]=='b' && a1.get(0)[2]=='a' && a1[1].get(0)=='d' && a1.get(1).get(1)=='c' && a1.get(1).get(2)=='a'){
        return 0
    }

    return 1
}
