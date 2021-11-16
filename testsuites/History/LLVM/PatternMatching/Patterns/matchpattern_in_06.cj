// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

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
    let score = #{50,60,70}
    let a = 50
    var r1: String = match (a) {
        case !in $score => "no"  // EXPECTED: regex unsupported type 'Set' for 'in pattern' in match case.
        case in $score => "yes"
        case _ => "default"
    }
    r1
}

func case02(){
    let a = 50
    var r1: String = match (a) {
        case !in #{50,60,70} => "no"  // EXPECTED: regex unsupported type 'Set' for 'in pattern' in match case.
        case in #{50,60,70} => "yes"
        case _ => "default"
    }
    r1
}

func case03(){
    let score = #{50:"yes",60:"no",70:"no"}
    let a = (50,"yes")
    var r1: String = match (a) {
        case !in $score => "no"  // EXPECTED: regex unsupported type 'Map' for 'in pattern' in match case.
        case in $score => "yes"
        case _ => "default"
    }
    r1
}

func case04(){
    let score = #{50:"yes",60:"no",70:"no"}
    let a = (50,"yes")
    var r1: String = match (a) {
        case !in #{50:"yes",60:"no",70:"no"} => "no" // EXPECTED: regex unsupported type 'Map' for 'in pattern' in match case.
        case in #{50:"yes",60:"no",70:"no"} => "yes"
        case _ => "default"
    }
    r1
}