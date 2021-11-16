// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    Data(var a!: Bool = true, var x: Bool){ //EXPECTED: regex named parameters must be listed behind all non-named parameters
        this.a = a
        this.x = x
    }
}

func run(): Int32 {
    var data: Data = Data(a: true, true) // EXPECTED: regex positional argument cannot appeared after named argument

    if(data.a){
    return 0
    }
    return 1
}
func main(): Int64 {
    return Int64(run())
}

