// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record Rectangle1 {
    let width1: Int32 = 10
    let length1: Int32 = 20
    let perimeter1: () -> Int32 = { => 2 * (width1 + length1) } // EXPECTED: regex 'width1' is not allowed to be accessed before all member variables are initialized
    init(){}
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
func main(){
    let newRectangle1_1 = Rectangle1() // Invoke the constructor defined by the empty init block.
    let newRectangle1_2 = Rectangle1(100, 200)  // Invoke the first custom constructor.
    let newRectangle1_3 = Rectangle1(300) // Invoke the second custom constructor.
    return 0
}

