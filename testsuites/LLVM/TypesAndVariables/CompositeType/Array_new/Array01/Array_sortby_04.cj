// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Char>(['s','d','r'])

func comp(lhs:Char, rhs:Char):Bool{
    return lhs < rhs
}

func main(): Int64 {

    a1.sortBy(comp)

    if(a1[0]=='d' && a1[1]=='r' && a1[2]=='s' ){
        return 0
    }
    return 1
}
