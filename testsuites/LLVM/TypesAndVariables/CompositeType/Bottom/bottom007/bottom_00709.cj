// ERRCHECK: %compiler %cmp_opt %f -o %output
enum A<T>{a(T)}

// func test():A<Int64> = A<Int64>.a(return A<Int64>.a(0))

func test():A<Int64> { A<Int64>.a(return A<Int64>.a(0)) } // EXPECTED: regex argument type of nothing is not supported

func main(): Int64 {
    return match (test()) {
        case a(x) => x
        case _ => 1
    }
}
