// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Father{}

class Child <: Father{}

func main(): Int64 {
    var b : ArrayList<Father> = ArrayList<Child>() // EXPECTED: regex return type for 'init' is mismatched
    return 1
}
