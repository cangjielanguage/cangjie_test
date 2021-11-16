// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test():Int64 { // EXPECTED: regex type of function body is incompatible with return type
return return
}

//func foo():Int64 = return return

func main(): Int64 {
return test()
}
