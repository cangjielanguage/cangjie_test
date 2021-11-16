// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %n.cj src/pkgs/pkgs.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package pkgs

class B {
    var str: String = match (A().opt) {   // EXPECTED: regex can not access field 'opt'
        case Some(x) => x
        case $None => ""
    }

}

func main(): Int64 {
    var b = B()
    if (b.str == "option"){
        return 0
    }
    return 1
}