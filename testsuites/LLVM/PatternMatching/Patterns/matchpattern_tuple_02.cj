// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (case01() != 0) {return 1}
    return 0
}

func case01(){
    let scoreTuple = ("a",90)
    let b = ("a",90)
    var result:String  = match (scoreTuple) {
        case (_, _) => "Yes"
    }
    if (result == "Yes") {return 0}
    return 1
}

