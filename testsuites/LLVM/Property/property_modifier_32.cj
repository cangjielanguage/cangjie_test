// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

prop var m:Int32 { // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition
    get(){
         return ( this.a + b + c + d )
    }
    set(input){
         a = input + 1
         c = input + 1
    }
}