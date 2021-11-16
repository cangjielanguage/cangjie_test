// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func a<X,Y>(x:X,y:Y):Bool {return true}

// func b():Int64 = a<Bool, Bool>(return 0, return 1)

func b():Int64 { a<Bool, Bool>(return 0, return 1) } // EXPECTED: regex argument type of nothing is not supported


func main(): Int64 {
return b()
}
