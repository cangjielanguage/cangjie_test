// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package option_type_modify_08n

class A {
    protected var opt: Option<String> = .Some<String>("option")
}

class B {
    var str: String = match (A().opt) {   // EXPECTED: regex can not access field 'opt'
        case Some(x) => x
        case $None => ""
    }
}

func main(): Int64{
    var b = B()
    if (b.str == "option"){
        return 0
    }
    return 1
}