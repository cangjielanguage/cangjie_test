package pkgs

external var a : Int64 = 0

external open class C1 {
  open func f() {
    a = 3
  } 
}