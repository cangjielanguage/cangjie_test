// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}

trait update{
    operator func [](a:This,b:This):This[]
}

append<T> A<T> with update {
    operator func [](a:A<T>,b:A<T>):Array<A<T>> {@{A<T>()}}
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var res : Int64 = match (b[a]) {
        case _ : A<Int32>[] => 0
        case _ => 1
    }
    return 0
}
