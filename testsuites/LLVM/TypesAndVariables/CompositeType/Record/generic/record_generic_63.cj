// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

record Data<T1> {
    let a: T1
    init(x: T1){
        a = x
    }
}

func main(){
    var a: Int64 = 2
    let data:Data<Int32> = Data<Int32>(a)  // EXPECTED: regex no matching constructor for call
    return 0
}
