// ERRCHECK: %compiler %cmp_opt %f -o %output
enum A<T>{a(T,T)}

// func test():A<Int64> = A<Int64>.a(return A<Int64>.a(0,0),return A<Int64>.a(1,1))

func test():A<Int64> { A<Int64>.a(return A<Int64>.a(0,0),return A<Int64>.a(1,1)) } // EXPECTED: regex argument type of nothing is not supported


func main(): Int64 {
    return match (test()) {
        case a(x,y) => x
        case _ => 2
    }
}
