// EXEC: %compiler -config="(test=true)" -c %cmp_opt %f -o %output

@when[test=="true"]
foreign func test()

@when[test=="true"]
unsafe func foo(){
    return test()
}

@when[test=="true"]
func main(){
    return 0
}