// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

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
        case !in $score => "no"
        case in $score => "yes"
        case _ => "default"
    }
    r1
}

func case02(){
    let a = 50
    var r1: String = match (a) {
        case !in #{50,60,70} => "no"
        case in #{50,60,70} => "yes"
        case _ => "default"
    }
    r1
}

func case03(){
    let score = #{50:"yes",60:"no",70:"no"}
    let a = (50,"yes")
    var r1: String = match (a) {
        case !in $score => "no"
        case in $score => "yes"
        case _ => "default"
    }
    r1
}

func case04(){
    let score = #{50:"yes",60:"no",70:"no"}
    let a = (50,"yes")
    var r1: String = match (a) {
        case !in #{50:"yes",60:"no",70:"no"} => "no"
        case in #{50:"yes",60:"no",70:"no"} => "yes"
        case _ => "default"
    }
    r1
}