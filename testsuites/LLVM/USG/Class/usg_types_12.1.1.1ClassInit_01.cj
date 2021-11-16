// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class C {
    private init() {}
    init(name: String, age: Int32) {}
}

func main(){

    return 0
}

