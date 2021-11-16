// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a:Char = if (true) { 'a' } else { "a" } // EXPECTED: regex error.*Types Char and Record-String of the two branches of this 'if' expression mismatch
    return 0
}
