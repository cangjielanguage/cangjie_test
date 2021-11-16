// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump


func main(): Int64 {
    return 0
}

class A<T,V> {

}

extend A<V,T> { // EXPECTED: regex-auto generics do not match the declaration of 'Class-A<Generics-T, Generics-V>'
    prop let a:Int64{
        get(){
            return 1
        }
    }
}
