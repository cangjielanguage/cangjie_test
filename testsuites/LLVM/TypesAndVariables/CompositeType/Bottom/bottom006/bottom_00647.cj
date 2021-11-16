// EXEC-1: %compiler %cmp_opt %f -o %output

func test() : Int64 { (return 1) ? ((return 2) ? (return 3) : (return 4)) : (return 5) }


func main(): Int64 {
    return test() - 1
}
