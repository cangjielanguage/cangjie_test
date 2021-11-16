package pkgs2

import pkgs.*

external class C2  <: C1{
  override func f() {
    a = 5
    super.f()
  } 
}
