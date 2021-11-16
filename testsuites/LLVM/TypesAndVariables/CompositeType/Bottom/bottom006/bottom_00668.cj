// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// return Int64 type not match List.
// func test():List<Int64> = [return 1, return 2]

func test():List<Int64> { [(return 1), (return 2)] } // EXPECTED: regex type of return expression is incompatible with return type


func main(): Int64 {
return 1
}

