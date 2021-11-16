package pkgs

external var a : Int64 = 0

external open class C1 {
  open func f() {
    a = 3
  }
}

external class C2 <: C1 {
  override func f() {
    a = 5
    super.f()
  }
}
