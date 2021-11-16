// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    return 0
}

class A<T> {

}

extend A { // EXPECTED: regex-auto generic type should be used with type argument
    prop let a:Int64{
        get(){
            return 1
        }
    }
}
