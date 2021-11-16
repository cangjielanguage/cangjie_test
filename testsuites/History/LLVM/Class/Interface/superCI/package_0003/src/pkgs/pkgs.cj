package pkgs

external var a : Int64 = 0

external interface I1a {
  func f() {
    a = 3
  } 
}