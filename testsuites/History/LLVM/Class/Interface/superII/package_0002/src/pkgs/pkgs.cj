package pkgs

external var a : Int64 = 0

external interface I1 {
  func f() {
    a = 3
  } 
}