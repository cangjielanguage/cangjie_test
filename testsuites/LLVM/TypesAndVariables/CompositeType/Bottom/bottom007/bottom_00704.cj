// ERRCHECK: %compiler %cmp_opt %f -o %output
// func test():Option<Int64> = Option<Int64>.Some(return Option<Int64>.Some(1))

func test():Option<Int64> { Option<Int64>.Some(return Option<Int64>.Some(1)) } // EXPECTED: regex argument type of nothing is not supported


func main(): Int64 {
    return match (test()) {
        case $Some<Int64>(x) => x - 1
        case _ => 1
    }
}
