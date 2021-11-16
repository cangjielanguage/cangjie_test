package pkgs

external open class Base {}

external interface I {}

external class Data <: Base & I {
    var a: Int64 = 5
}