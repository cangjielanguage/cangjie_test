// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

trait MyTrait {
    func add(x: This, y: This): This
}

type Dict<V> where V <: MyTrait = Map<Int32,V>   // EXPECTED: regex expected '=' after type alias name

func main(): Int64 {
    var data: Dict<V> = #{1:"a", 2:"b"}
    return 0
}