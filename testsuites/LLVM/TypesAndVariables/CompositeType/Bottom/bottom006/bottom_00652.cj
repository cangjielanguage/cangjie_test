// EXEC-1: %compiler %cmp_opt %f -o %output

func test() : Int64 {true ? (true ? (return 2) : return 3) : (true ? (return 5) : return 6)}


func main(): Int64 {
    return test() - 2
}
