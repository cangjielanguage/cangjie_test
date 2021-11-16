// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

trait MyTrait {
    func add(x: This, y: This): This
}

type Dict = Map<Int32,V> where V <: MyTrait  // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition

func main(): Int64 {
    var data: Dict = #{1:"a", 2:"b"}
    return 0
}