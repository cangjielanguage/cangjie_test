// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && %run %run_opt %output %run_args | compare %f
// ASSERT: scan hello world


from ffi import c.*
foreign func strcat(lhs: CString, rhs: CString) : CPointer<UInt8>
func main() {
    var s1 = CString("hello ")
    var s2 = CString("world")
    let t1: Int64 = s1.size()
    let t2: Bool = s2.isEmpty()
    let t3: Bool = s1.equals(s2)
    let t4: Bool = s1.startsWith(s2)
    let t5: Int32 = s1.compare(s2)
    let s3: CPointer<UInt8> = unsafe { strcat(s1, s2) }
    
    var r3 = CString(s3).toString()

    print("${r3}")
    
    s1.free()
    s2.free()
    
    return 0
}



