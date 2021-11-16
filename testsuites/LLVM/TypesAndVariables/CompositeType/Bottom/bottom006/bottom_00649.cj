// EXEC-1: %compiler %cmp_opt %f -o %output

func test() : Int64 { true ? (return 5) : ((return 2) ? (return 3) : return 4) }


func main(): Int64 {
    return test() - 5
}
