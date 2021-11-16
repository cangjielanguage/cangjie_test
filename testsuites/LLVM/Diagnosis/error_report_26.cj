// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

class Bar<T> {}

class Data<T>
    where T <: Bar<T>{ // EXPECTED: regex note.*'Int32' is not '<:' 'Class-Bar<Int32>'
    var classFoo: T
    init(x: T){
        classFoo = x
    }
}

func main(): Int64 {
    let data= Data<Int32>(2)
    return 0
}
