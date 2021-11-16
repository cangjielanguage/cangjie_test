package pkgs

external interface Test {
    static func foo(): Int32{
        return 2
    }
}
external class test <: Test{}