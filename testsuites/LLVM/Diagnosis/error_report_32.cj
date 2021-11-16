// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func foo(x:Int64){x}
func main() {
    foo(3.14)       // EXPECTED: regex cannot convert a floating-point literal to type 'Int64'
    return 0
}
