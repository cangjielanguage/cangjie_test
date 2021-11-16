// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (case01() != 0) {return 1}
    if (case02() != 0) {return 1}
    return 0
}

func case01(){
    let a = ()
    var result  = match ((1,())) {
        case (1,$a) => "Yes"
        case _  => "None"
    }
    if (result == "Yes") {return 0}
    return 1
}

func case02(){
    let a = ()
    var result  = match (()) {
        case $a => "Yes"
        case _  => "None"
    }
    if (result == "Yes") {return 0}
    return 1
}
