// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a : String = "abc"
    var result: Int64 = match (a) {
        case #"abc
"# => 2
        case #"abc"# => 0
        case _ => 1
    }
    return result
}