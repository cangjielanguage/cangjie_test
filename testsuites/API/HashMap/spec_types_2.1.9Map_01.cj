// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
open class A { }
class B <: A { }
func foo() {
    var mapThree: HashMap<Int64, Char>
    mapThree = HashMap<Int64, Char>([(7,'g'),(8,'h'),(9,'i')])
}
func main(){
    let mapZero: HashMap<Int32, Char> =HashMap<Int32, Char> ()  // empty Map
    let mapOne: HashMap<Int32, String> = HashMap<Int32, String> ([(1,"Aa"),(2,"Bb"),(3,"Cc"),(1,"fir")]) // mapOne = #{1 : "Aa", 2 : "Bb", 3 : "Cc"}, as duplicated key and its value '1 : "fir"' is removed
    var mapTwo =HashMap<Int32, String>([(4,"Dd"),(5,"Ee"),(6,"Ff")]) // The type of mapTwo is inferred to be HashMap<Int64, String>
    return 0
}

