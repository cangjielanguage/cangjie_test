// EXEC-1: %compiler %cmp_opt %f -o %output

func test() : Int64  { (false ? (false ? (return 2) : return 3) : false) ? (return 5) : return 6 }

func main(): Int64 {
    return test() - 6
}
