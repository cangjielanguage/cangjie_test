// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main():Int64 {
    let scoreTuple = (1,1)
    var result:String  = match (scoreTuple) {
        case (x , $x) => "Yes" // EXPECTED: regex error.*'x' has defined in this case
        case (_, _) => "None"
    }
    if (result == "Yes") {return 0}
    return 1
}
