// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Get from Cangjie pointer success.


from ffi import c.*  // CPointer位于FFI标准库中，使用时需要引入该类型

foreign func PassInt32PointerToCangjie() : CPointer<Int32>
foreign func GetInt32PointerFromCangjie(a : CPointer<Int32>) : Unit

func main() {
    var a = unsafe{ PassInt32PointerToCangjie() }
    if (unsafe { a.read() } != 2147483647) {
        return 1
    }
    unsafe{ GetInt32PointerFromCangjie(a) }
    0
}
