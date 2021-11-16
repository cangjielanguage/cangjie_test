// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// func test():Int64 = Option<Int64>.Some(return 1)

func test():Int64 {return Option<Int64>.Some(1)} // EXPECTED: regex-auto return type for 'Some' is mismatched
func main(): Int64 {
return 0
}
