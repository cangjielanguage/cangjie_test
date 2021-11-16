// DEPENDENCE: append_60043.cj main.cj
// ERRCHECK: %compiler %cmp_opt %enable_macro append_60043.cj %append_opt
// ASSERT: scan imported type 'HashSet' cannot extend import interface
package define
from std import collection.*
import append_60043.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var a : HashSet<Int64> = HashSet<Int64>([1])
    var x = quote($a)
    var y = quote($a)
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 2) {
        return quote(2)
    }
    return x
}
