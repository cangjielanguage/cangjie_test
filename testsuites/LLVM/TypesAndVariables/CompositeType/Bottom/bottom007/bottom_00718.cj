// ERRCHECK: %compiler %cmp_opt %f -o %output
func a(input:Int64): Int64 {return 1}

// func b(): Int64 = a(return 0)

func b(): Int64 { a(return 0) } // EXPECTED: regex argument type of nothing is not supported

func main(): Int64 {
    return b()
}
