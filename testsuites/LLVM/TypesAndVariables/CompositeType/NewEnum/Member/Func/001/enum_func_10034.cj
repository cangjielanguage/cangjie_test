// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    func a(x:Int64) {0} // EXPECTED: regex invalid constructor in enum declaration
}

func main(): Int64 {
    return 0
}
