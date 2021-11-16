package pkg

from ffi import c.*

foreign func testfunc(i8a: Int8, i8b: Int8):Int8

// todo
external var a: Int8 = 1

external unsafe func newtestfunc(i8a: Int8, i8b: Int8):Int8{
    return testfunc(i8a, i8b)
}
