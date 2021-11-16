// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface Add<T> {
    operator func +(b: T): String
}

extend Char <: Add<Char>{
    operator func +(b: Char): String {
        return (this.toString() + b.toString() + "!")
    }
}

var c1 = 'a'
var c2 = 'b'

func run(): Int64 {
    var res1 = c1 + c2
    if ( res1 == "ab!") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
