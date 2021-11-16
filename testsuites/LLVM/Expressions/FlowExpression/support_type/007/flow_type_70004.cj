// ERRCHECK: %compiler %cmp_opt %f -o %output

func a(x:Int64,y:Int64):Int32 {0}
func b(input:Int32):Int64 {0}

func main(): Int64 {
    b ~> a // EXPECTED: regex-auto type check of flow expression fails for operator ~>
    a ~> b // EXPECTED: regex-auto type check of flow expression fails for operator ~>
    a ~> a // EXPECTED: regex-auto type check of flow expression fails for operator ~>
    return 1
}
