// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a = if (true) { 'a' } else { 1 } // EXPECTED: regex error.*Types Char and Int64 of the two branches of this 'if' expression mismatch
    return 0
}

class A<: Any{}

