// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    return 0
}

class A<Int64> { // EXPECTED: regex-auto 'Int64' is keyword not identifier, you can use '`Int64`' instead
}

class B<String> { // EXPECTED: regex-not error
}