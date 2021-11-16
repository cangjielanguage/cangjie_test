// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var ret : Child = Child(3)
    if ( ret.a != 3 ) {
        return 1
    }
    return 0
}

open class GrandFather {}

open class Father <: GrandFather {
    Father(
        private var a : Int64
        ) {}
}

class Child <: Father {
    Child(
        public var a : Int64
    ) {
        super(a)
    }
}