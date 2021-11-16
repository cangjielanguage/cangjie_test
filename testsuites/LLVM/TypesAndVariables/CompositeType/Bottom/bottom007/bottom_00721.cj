// ERRCHECK: %compiler %cmp_opt %f -o %output
func a<T>(x:T):Int64 {return 1}

// func b():Int64 = a<Bool>(return 0)

func b():Int64 { a<Bool>(return 0) } // EXPECTED: regex argument type of nothing is not supported


func main(): Int64 {
    return b()
}
