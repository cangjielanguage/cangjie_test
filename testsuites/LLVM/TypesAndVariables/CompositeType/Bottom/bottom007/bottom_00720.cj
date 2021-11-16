// ERRCHECK: %compiler %cmp_opt %f -o %output
func a<T>(x:T):Int64 {return 1}

// func b():Int64 = a(return 0)

func b():Int64 { a(return 0) } // EXPECTED: regex expression of Nothing type cannot appear here currently


func main(): Int64 {
    return b()
}
