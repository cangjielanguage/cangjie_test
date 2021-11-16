// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a = if (true) { A() } else { B() } // EXPECTED: regex error.*Types Class-A and Class-B of the two branches of this 'if' expression mismatch
    return 0
}

class A<: Any{}

class B<: Any{}
