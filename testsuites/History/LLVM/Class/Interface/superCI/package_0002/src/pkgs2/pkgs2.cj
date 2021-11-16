package pkgs2

import pkgs.*

external class C2 <: I1{
  func f() {
    a = 5
    super<I1>.f()
  } 
}
