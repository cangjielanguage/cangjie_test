// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass1\n
// ASSERT: scan pass2\n
// ASSERT: scan-not Exception

from ffi import c.*

let AI_PASSIVE: Int32 = 0x0001
let AI_ALL: Int32 = 0x0010
let NULL_CSTRING = CString(CPointer<UInt8>())
let BYTES_ADDR_INFO: UIntNative = 48
let AI_IPPROTO_TCP: IntNative = 6

@c
record teststruct {
    var a: Int32
    var b: Int32
    var c: Int32
    var d: Int32
    var e: Int32
    var flags: Int32 = AI_PASSIVE | AI_ALL
    var family: Int32 = 1
    var socktype: Int32 = 0
    var protocol: Int32 = 0
    var addrlen: Int32 = 0
    var addr: CPointer<Unit> = CPointer<Unit>()
    var canonname: CString = NULL_CSTRING
    var next: CPointer<teststruct> = CPointer<teststruct>()

    func toString(): String {
        "flags=${flags}, family=${family}, socktype=${socktype}, protocol=${protocol}, addrlen=${addrlen}"
    }
}

foreign {
    func testfunc(a: Int8, pst: CPointer<teststruct>): CPointer<teststruct>
    func MallocWithZero(size: UIntNative): CPointer<Int8>
}

unsafe func main():Int64 {
    var pa = MallocWithZero(10)
    var pb = CPointer<Unit>(pa)

    var struct1 = teststruct(a: -111, b: 111, c: -111, d: 111, e: -111, flags: AI_ALL, family: 1, socktype: 0, protocol: 0, addrlen: 0, addr: pb, canonname: NULL_CSTRING)

    var p1 = MallocWithZero(16)
    var pst1 = CPointer<teststruct>(p1) 
    pst1.write(struct1)

    var pst2 = testfunc(11, pst1)

    if ( (pst2.read().a == -122) && (pst2.read().b == 122) && (pst2.read().c == -122) && (pst2.read().d == 122) && (pst2.read().e == -122)) {
        print("pass2\n")
    }

    return 0
}
