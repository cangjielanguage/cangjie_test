// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record R {
    var item1: Int64
    var item2 = 3.14
    var item3: String = "Hello"
    /* The auto-generated memberwise constructor:
    init(item1!: Int64, item2!: Float64 = 3.14, item3!: String = "Hello"){
        this.item1 = item1
        this.item2 = item2
        this.item3 = item3
    }
    */
}

func main(){
    let r1 = R(item1: 1, item2: 1.2, item3: "a") 
    let r2 = R(item3: "a", item2: 1.2, item1: 1)
    let r3 = R(item1: 1)
    return 0
}

