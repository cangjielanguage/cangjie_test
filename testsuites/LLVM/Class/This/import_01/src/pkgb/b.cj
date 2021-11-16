package pkgb
import pkga.Boo

external var bb = 0
external class Coo <: Boo{
    override func foo() : This{
        bb++
        this
    }
}