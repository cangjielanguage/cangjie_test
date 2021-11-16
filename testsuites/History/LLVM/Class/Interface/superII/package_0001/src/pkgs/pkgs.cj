package pkgs

external var a : Int64 = 0

external interface I1 {
  func f() {
    a = 3
  }
}

external interface I2 <: I1 {
  func f() {
    a = 5
    super<I1>.f()
  }
}
