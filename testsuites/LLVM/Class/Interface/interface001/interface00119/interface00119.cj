// DEPENDENCE: interface00119a cfg-ast
// EXEC: %compiler %cmp_opt -c interface00119a/interface00119a.cj -o interface00119a.%middle && %copycharjs interface00119a
// EXEC: %compiler %cmp_opt %f interface00119a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import interface00119a.*
interface A <: interface00119a.MyInterface{}
class B <: A{}
func main() : Int64 {
    var a = B()
    return 0
}

