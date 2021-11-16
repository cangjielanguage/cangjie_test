package pkgb
import pkga.Boo

external class Coo <: Boo{
    redef static func foo(){
        return 2
    }
}