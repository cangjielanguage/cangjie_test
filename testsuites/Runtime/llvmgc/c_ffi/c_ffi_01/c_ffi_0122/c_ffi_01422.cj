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
    var i8p: CPointer<Int8>
    var str: CString
}

@c
external func cjFunc(cp: CPointer<Data>): CPointer<Data> {
    var data = unsafe { cp.read() }
    unsafe {
      if ((data.b == true ) && (data.ui8 == 0) && (data.i8 == -1) && (data.ui16 == 0) && (data.i16 == -1) && (data.ui32 == 0) && (data.i32 == -1) && (data.ui64 == 0) && (data.i64 == -1) && (data.str.equals(CString("abc")))) {
          println("pass1")
      }
    }

    var pa = CPointer<Int8>()
    var s = CString("efg")

    var p = cp
    var data2 = Data(b: false, ui8: 3, i8: 1, ui16: 3, i16: 1, ui32: 3, i32: 1, ui64: 3, i64: 1, f32: 2.0, f64: 2.0, i8p: pa, str: s)
    unsafe{ p.write(data2) }

    return p
}
