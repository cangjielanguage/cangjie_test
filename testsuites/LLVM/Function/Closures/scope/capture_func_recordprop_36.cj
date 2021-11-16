// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

record Aoo{
    var a: Int32 = 1
    let b: Int32 = 2
    var c = if(true){
        prop var poo2:Int32{ // EXPECTED: regex error.*?'prop' is not allowed in block, expected expression or declaration here
            get(){
                var x = a+b;return x
            }
            set(v){
                var x = a+b
            }
        }
    }
}
