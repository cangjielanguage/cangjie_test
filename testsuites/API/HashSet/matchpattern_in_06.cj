// EXEC-PIPE-1: %compiler %stdx_cmp_opt %n.cj -o %output 2>&1 | compare %f

from std import collection.*
func main():Int64 {
    if ( case01() != "yes" ) {
        return 1
    }
    if ( case02() != "yes" ) {
        return 1
    }
    if ( case03() != "yes" ) {
        return 1
    }
    if ( case04() != "yes" ) {
        return 1
    }
    return 0
}

func case01(){
    let score =HashSet<Int64>([50,60,70])
    let a = 50
    var r1: String = match (a) {
        case !in $score => "no"  // EXPECTED: regex unsupported type 'HashSet' for 'in pattern' in match case.
        case in $score => "yes"
        case _ => "default"
    }
    r1
}

func case02(){
    let a = 50
    var r1: String = match (a) {
        case !in HashSet<Int64>([50,60,70]) => "no"  // EXPECTED: regex unsupported type 'HashSet' for 'in pattern' in match case.
        case in HashSet<Int64>([50,60,70]) => "yes"
        case _ => "default"
    }
    r1
}

func case03(){
    let score = HashMap<Int64,String>([(50,"yes"),(60,"no"),(50,"no")])
    let a = (50,"yes")
    var r1: String = match (a) {
        case !in $score => "no"  // EXPECTED: regex unsupported type 'HashMap' for 'in pattern' in match case.
        case in $score => "yes"
        case _ => "default"
    }
    r1
}

func case04(){
    let score = HashMap<Int64,String>([(50,"yes"),(60,"no"),(50,"no")])
    let a = (50,"yes")
    var r1: String = match (a) {
        case !in HashMap<Int64,String>([(50,"yes"),(60,"no"),(50,"no")]) => "no" // EXPECTED: regex unsupported type 'HashMap' for 'in pattern' in match case.
        case in HashMap<Int64,String>([(50,"yes"),(60,"no"),(50,"no")]) => "yes"
        case _ => "default"
    }
    r1
}