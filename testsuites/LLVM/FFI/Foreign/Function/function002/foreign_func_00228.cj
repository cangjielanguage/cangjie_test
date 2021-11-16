// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

foreign func foo(a:Option<Int64>):Option<Int64> // EXPECTED: regex native function can only have CType args.

foreign {
    func bar(a:Option<Int64>):Option<Int64> // EXPECTED: regex native function can only have CType args.
}
