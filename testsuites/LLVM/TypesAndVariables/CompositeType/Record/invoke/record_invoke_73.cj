// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

record Data {
let width: Int32 = 2
let length: Int32 = 4
init(x: Int32, y: Int32){
width = x
length =y
}
func area(){
return width*length
}
}

func run(): Int64 {
let data: Data = Data()
var res = data.area1() // EXPECTED: regex is not a member of record
return 0
}

func main(): Int64 {
return run()
}

