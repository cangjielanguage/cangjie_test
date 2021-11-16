// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a : Char = 'a'
    var result: Int64 = match (a) {
        case '\n' => 2
        case 'a' => 0
        case _ => 1
    }
    return result
}