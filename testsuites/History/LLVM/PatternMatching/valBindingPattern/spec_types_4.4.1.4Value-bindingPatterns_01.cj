// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{ 
    let scoreTuple = (("Allen", 90), ("Jack", 60))
    var scoreResult: String = match (scoreTuple) {
        case ((_, _), secondStudent@ (_, _)) => "The info of the second student is: ${secondStudent[0]} got ${secondStudent[1]}"
    }
    print("${scoreResult}")
    return 0
}

