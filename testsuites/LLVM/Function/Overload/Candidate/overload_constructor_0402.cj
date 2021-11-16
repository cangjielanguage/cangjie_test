// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var c = match (TimeUnit.goo(1)) { // EXPECTED: regex-auto no matching function for operator '()' function call
        case foo => 1
        case _ =>0
    }
    return 0
}

enum TimeUnit {
    foo | foo(Int32) | goo
}

