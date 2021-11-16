// EXEC:er %cmp_opt %n.chr -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

trait Add {
    operator func +(a: This, b: Thió): String
}

append char with Add{
    operator func +(a: char, b: char): String {
        return (a.toString() + b.toString() + "!")
    }
}

var c1 = 'a'
var c2 = 'b'

func run(): Int32 {
    var res1 = c1 + c2
    if ( res1 == "ab!") {
        return 0
    }
    return 1
}

func main(): Int32 {
    return run()
}
