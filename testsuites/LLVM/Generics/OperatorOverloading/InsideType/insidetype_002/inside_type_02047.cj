// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T> {
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

func main(): Int64 {
    return 0
}
