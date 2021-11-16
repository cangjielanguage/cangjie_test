// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record Rectangle1 {
    let width1: Int32 = 10
    let length1: Int32 = 20
    let perimeter1: () -> Int32 = { => 2 * (width1 + length1) } // EXPECTED: regex 'width1' is not allowed to be accessed before all member variables are initialized
    init (width1: Int32, length1: Int32) {
        this.width1 = width1
        this.length1 = length1
    }
    init (side: Int32) {
        this.width1 = side
        this.length1 = side
    }
    func area1(): Int32 { width1 * length1 }
}
/*
record Rectangle2 <T> {
    let width2: T
    let length2: T
    let perimeter2 = { => 2 * (width2 + length2) }
    init (side: T) {
        this(side, side)
    }
    init (width2: T, length2: T) {
        this.width2 = width2
        this.length2 = length2
    }
    func area2(): T { width2 * length2 }
}
*/
func main(){
    var t = Rectangle1(2,4).area1()
    print("${t}")
    return 0
}

