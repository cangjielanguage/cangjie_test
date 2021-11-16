package pkgs

external var a : Int64 = 0

interface I1 {
  func f() {
    a = 3
  } 
}

external class C2 <: I1 {
  func f() {
    a = 5
    super<I1>.f()
  } 
}
