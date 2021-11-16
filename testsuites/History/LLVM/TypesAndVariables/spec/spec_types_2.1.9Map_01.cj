// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A { } 
class B <: A { }
func foo() {
    var mapThree: Map<Int64, Char>
    mapThree = #{7: 'g', 8: 'h', 9: 'i'}
}
func main(){
    let mapZero: Map<Int32, Char> = #{}  // empty Map 
    let mapOne: Map<Int32, String> = #{1: "Aa", 2: "Bb", 3: "Cc", 1: "fir"}  // mapOne = #{1 : "Aa", 2 : "Bb", 3 : "Cc"}, as duplicated key and its value '1 : "fir"' is removed
    var mapTwo = #{4: "Dd", 5: "Ee", 6: "Ff"}  // The type of mapTwo is inferred to be Map<Int64, String>
 //   var mapFour = #{A(): B(), B(): B()}  // The type of mapFour is inferred to be Map<A, B>
//    var mapFive = #{1..10: 1, 1..10: 2}  // The type of mapFive is inferred to be Set<Range<Int64>>.
//    var mapSix = #{1..10: 1: 100 , 1..10: 2: 200}  // The type of mapSix is inferred to be Map<Range<Int64>, Int32>
    let nestedMap = #{#{1: "Aa", 2: "Bb", 3: "Cc"}: #{7: 'g', 8: 'h', 9: 'i'}}  // The type of nestedMap is inferred to be Map<Map<Int64, String>, Map<Int64, Char>>
    return 0
}

