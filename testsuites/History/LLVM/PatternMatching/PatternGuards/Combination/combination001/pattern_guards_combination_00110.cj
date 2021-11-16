// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(){
    let i : Set<Int32> = #{60, 70, 80, 90, 100}
    let j : Int32 = 60
    var a : Int64 = match (j) {
        case in $i if (false) => 2 // EXPECTED: regex unsupported type 'Set' for 'in pattern' in match case.
        case in $i if (true) => 1
        case _ => 0

    }
    return (a-1)
}
