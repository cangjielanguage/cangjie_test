// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// return Int64 type not match ArrayList.
// func test():ArrayList<Int64> = ArrayList<Int64>([(return 1), (return 2)].toArray())

func test():ArrayList<Int64> {ArrayList<Int64>([return 1].toArray())} // EXPECTED: regex type of return expression is incompatible with return type


func main(): Int64 {
return 1
}

