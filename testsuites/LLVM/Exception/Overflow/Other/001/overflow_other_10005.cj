// EXEC:  %compiler %cmp_opt %f -o %output 2>&1 | compare %f


@overflowThrowing
func test(a:Int8,b:Int8){
    var x : Int8 = 200 // EXPECTED: regex the number '200' exceeds the value range of type 'Int8'
    return 1
}

func main(){
    return Int64(test(100,100))
}
