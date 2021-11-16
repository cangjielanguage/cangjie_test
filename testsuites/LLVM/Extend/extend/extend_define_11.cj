// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

extend foo {  // EXPECTED: regex undeclared type name 'foo'
    func plus() { 1 }
}

func main(): Int64 {
    return 0
}