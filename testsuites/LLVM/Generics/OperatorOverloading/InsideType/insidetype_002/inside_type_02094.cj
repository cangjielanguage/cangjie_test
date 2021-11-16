// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T> {
    operator func !(): Bool { true }
    operator func -(): Bool { true }
    operator func []( b: A<T>): Bool { true }
    operator func **( b: A<T>): Bool { true }
    operator func *( b: A<T>): Bool { true }
    operator func /( b: A<T>): Bool { true }
    operator func %( b: A<T>): Bool { true }
    operator func +( b: A<T>): Bool { true }
    operator func -( b: A<T>): Bool { true }
    operator func <<( b: A<T>): Bool { true }
    operator func >>( b: A<T>): Bool { true }
    operator func <( b: A<T>): Bool { true }
    operator func <=( b: A<T>): Bool { true }
    operator func >( b: A<T>): Bool { true }
    operator func >=( b: A<T>): Bool { true }
    operator func ==( b: A<T>): Bool { true }
    operator func !=( b: A<T>): Bool { true }
    operator func &( b: A<T>): Bool { true }
    operator func ^( b: A<T>): Bool { true }
    operator func |( b: A<T>): Bool { true }
//     operator func ^^( b: A<T>): Bool { true }
}

// class A_B <: A<A<T>>{}

func main(): Int64 {
    return 0
}
