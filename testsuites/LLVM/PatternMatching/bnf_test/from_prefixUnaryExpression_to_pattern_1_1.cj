// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var c =  -((match(1){case _ =>2})--)++  // EXPECTED: regex error.*paren_expr is illegal before this increment or decrement expression
    return 0
}
