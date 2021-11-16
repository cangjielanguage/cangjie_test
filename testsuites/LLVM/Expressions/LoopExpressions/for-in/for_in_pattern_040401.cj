// EXEC-PIPE-1: %compiler %cmp_opt %f  -o %output 2>&1 | compare %f

func main():Int64 {
    if ( case01() != 2 ) {
        return 7
    }
    return 0
}

func case01(){
    let intList: List<(Int32*Int32)> = [(0,0), (1,1), (2,2)]
    var a: Int32 = 0
    for ((x,x) in intList) { // EXPECTED: regex error.*redefinition of declaration 'x'
        a = x
    }
    a
}
