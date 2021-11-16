// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex native function can only have CType args.
// ASSERT: regex native function can only have CType return.

foreign func a(x:?Int64):?Int64

func main(): Int64 {
    return 0
}
