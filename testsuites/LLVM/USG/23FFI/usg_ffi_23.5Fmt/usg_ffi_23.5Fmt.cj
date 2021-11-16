// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1 2 3 4 5 6

from ffi import c.*

foreign func printf(fmt: CString, ...) : Int32

func main() : Int64 {
    var s = CString("%d %d %d %d %d %d\n")
    unsafe{ printf(s, 1, 2, 3, 4, 5, 6) }
    s.free()
    0
}
