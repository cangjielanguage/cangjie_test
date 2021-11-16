// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

class Data<T>
    where T <: Int64{ // EXPECTED: regex note.*'Int32' is not '<:' 'Int64'
    var classFoo: T
    init(x: T){
        classFoo = x
    }
}

func main(): Int64 {
    let data= Data<Int32>(2)
    return 0
}
