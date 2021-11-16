// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main() : Int64 {
    if ( case01() != 0){
        return 1
    }
    return 0
}

func case01(){
    let a = 0..10:2
    var r = match (a) {
        case !in  0..10 => 1 // EXPECTED: regex incompatible type for 'in pattern' in match case.
        case in  0..=10:1 => 0
        case _ => 3
    }
    return r
}
