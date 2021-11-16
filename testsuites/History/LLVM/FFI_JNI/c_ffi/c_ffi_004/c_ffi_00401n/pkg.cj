package test

from ffi import c.*

foreign func testfunc(): CPointer<Bool>
