// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

enum TimeUnit{
    Year(y:Int64,x!:Int64=match (1){ case _ => 1}) // EXPECTED: regex error.*expect
}

func main(): Int64 {
    var a = TimeUnit.Year(1)
    var b = match (a) {
        case Year(a,b) => a+b
        case _ => 0
    }
    if ( a != 2 ){
        return 1
    }
    return 0
}
