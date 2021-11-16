// EXEC-1: %compiler %cmp_opt %f -o %output

func test() : Int64 { false ? ((return 2) ? (return 3) : (return 4)) : return 5 }


func main(): Int64 {
    return test() - 5
}
