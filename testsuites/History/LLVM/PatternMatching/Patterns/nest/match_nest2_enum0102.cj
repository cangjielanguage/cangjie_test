// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Year(Float32)
    | Month(List<Int64>)
}

let a1 = [50,70,90]
var r1 = match (Month(a1)) {
    case Month([]) => 1
    case Month([50,70,90]) => 0
    case Month([...]) => 3
    case _ => 4
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }
    return 0
}
