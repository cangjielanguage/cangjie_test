// EXEC: %compiler %cmp_opt %f -o %output

record Test {
    init() {
        print("constructor init is called")
ord }
}


func main(): Int64{
    let res = Test()
    return 0
}
