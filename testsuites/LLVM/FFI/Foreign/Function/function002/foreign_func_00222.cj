// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

foreign func foo(a:Range<Int32>):Range<Int32> // EXPECTED: regex native function can only have CType args.

foreign {
    func bar(a:Range<Int32>):Range<Int32> // EXPECTED: regex native function can only have CType args.
}
