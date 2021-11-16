// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test():Int64 = match (true) {
case return => return 1
case _ => return 2
}

func test():Int64 { match (true) {
case (return) => return 1 // EXPECTED: regex expected pattern here
case _ => return 2
}
}

func main(): Int64 {
return 1
}
