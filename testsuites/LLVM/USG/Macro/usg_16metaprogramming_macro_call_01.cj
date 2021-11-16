import macro define.*

func main(): Int64{
    print("I'm in function body\n")
    let a: Int64 = @TestDef(1 + 2)
    print("a = ${a}\n")
    return 0
}