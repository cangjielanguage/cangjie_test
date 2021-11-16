// DEPENDENCE: %n.c
// EXEC: %compiler %f -shared %cffi_runtime_opt -o lib%n.so
// EXEC: %clang %cffi_runtime_link %n.c -L. -l%n -o %n
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH ./%n 2>&1 | compare %f
// ASSERT: scan pass1
// ASSERT: scan pass2

from ffi import c.*

@c
external record Data {
    var b: Bool
    var ui8: UInt8
    var i8: Int8
    var ui16: UInt16
    var i16: Int16
    var ui32: UInt32
    var i32: Int32
    var ui64: UInt64
    var i64: Int64
    var f32: Float32
    var f64: Float64
}

@c
external func cjFunc(cp: CPointer<Data>): CPointer<Data> {
    unsafe {
        if ((cp.read().b == true ) && (cp.read().ui8 == 0) && (cp.read().i8 == -1) && (cp.read().ui16 == 0) && (cp.read().i16 == -1) && (cp.read().ui32 == 0) && (cp.read().i32 == -1) && (cp.read().ui64 == 0) && (cp.read().i64 == -1)) {
            println("pass1")
        }
    }
    
    var p = cp
    var data = Data(b: false, ui8: 3, i8: 1, ui16: 3, i16: 1, ui32: 3, i32: 1, ui64: 3, i64: 1, f32: 2.0, f64: 2.0)
    unsafe{ p.write(data) }

    return p
}
