// ERRCHECK: %compiler %cmp_opt %f -o %output

func a<T>(x:T):T {x}
func b(input:Int32):Int64 {0}

func main(): Int64 {
    a ~> b // EXPECTED: regex-auto type check of flow expression fails for operator ~>
    b ~> a // EXPECTED: regex-auto type check of flow expression fails for operator ~>
    return 1
}
