// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    case01()
    return 0
}

func case01(){
    let a = ()
    var result  = match (()) {
        case $a => 0
        case _  => 1
    }
    return 0
}