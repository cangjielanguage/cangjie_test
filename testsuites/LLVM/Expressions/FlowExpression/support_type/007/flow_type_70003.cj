// ERRCHECK: %compiler %cmp_opt %f -o %output

func a(input:Int64):Int64 {0}
func b(input:Int32):Int32 {0}

func main(): Int64 {
    a ~> b // EXPECTED: regex-auto type check of flow expression fails for operator ~>
    b ~> a // EXPECTED: regex-auto type check of flow expression fails for operator ~>
    return 1
}
