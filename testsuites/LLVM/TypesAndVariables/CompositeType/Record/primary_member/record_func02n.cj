// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto  'record' is not allowed in block, expected expression or declaration here
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

func run(): Int64 {
    record Test{
        let width: Int32 = 2
        let length: Int32 = 5
        func area(): Int32 {
            return width * length
        }
    }

    let test = Test().area()

    if(test == 10){
          return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

