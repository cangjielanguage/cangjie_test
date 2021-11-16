// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1 2 3 4 5 6


from ffi import ffiC.CString


foreign func printf(fmt: CString, ...) : Int32

func main() : Int64 {
    var s = CString("%d %d %d %d %d %d\n")
    unsafe{ printf(s, 1, 2, 3, 4, 5, 6) }
    s.free()
    0
}
