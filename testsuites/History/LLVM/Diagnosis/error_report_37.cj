// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

class A {}
func main(): Int64 {
    let map:Map<Int64,A> = #{1:A(), 2:A()}
    let a = (1,A())
    match (a) {
        case in $map => "pass"  // EXPECTED: regex unsupported type 'Map' for 'in pattern' in match case.
        case _ => "fail"
    }
    return 0
}

