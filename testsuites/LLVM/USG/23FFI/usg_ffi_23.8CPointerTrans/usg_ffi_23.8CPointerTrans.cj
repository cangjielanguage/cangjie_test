// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %chirvic off %ffic_opt -o %output
// EXEC: export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not error

from ffi import c.*

foreign func PassInt32PointerToCangjie() : CPointer<Int32>

func main() {
    var a : CPointer<Int32> = unsafe{ PassInt32PointerToCangjie() }
    var b : CPointer<Int64> = CPointer<Int64>(a)
    0
}
