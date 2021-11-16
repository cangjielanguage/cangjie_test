// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record Rectangle2 <T> {
    let width2: Int32 = 10
    let length2: Int32 = 10
    let perimeter2 = { => 2 * (width2 + length2) } // EXPECTED: regex 'width2' is not allowed to be accessed before all member variables are initialized
    init (side: Int32) {
        this(width2:side, length2:side)
    }
    init (width2!: Int32, length2!: Int32) {
        this.width2 = width2
        this.length2 = length2
    }
    init (width2!: Int32, length2!: Int32, perimeter2!:() -> Int32 ) {
        this.width2 = width2
        this.length2 = length2
        this.perimeter2 = perimeter2
    } 
    func area2(): Int32 { width2 * length2 }
}


func main(){
    let newRectangle2_1 = Rectangle2<Int32>(100)  // Invoke the custom constructor.
    let newRectangle2_2 = Rectangle2<Int32>(width2:10, length2:20)  // Invoke another custom constructor.
//    let newRectangle2_3 = Rectangle2<Int32>(width2:10, length2:20, perimeter2:{2 * width2 + 2 * length2})  // Change the default value of perimeter2.
    return 0
}

