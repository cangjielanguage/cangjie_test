// ERRCHECK: %compiler %cmp_opt %f -o %output
enum A{a(Int64)}

// func test():A = A.a(return A.a(0))

func test():A { A.a(return A.a(0)) } // EXPECTED: regex argument type of nothing is not supported

func main(): Int64 {
    return match (test()) {
        case a(x) => x
        case _ => 1
    }
}
