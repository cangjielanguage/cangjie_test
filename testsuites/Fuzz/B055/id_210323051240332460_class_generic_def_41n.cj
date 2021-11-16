// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump

func main(): int64 {
    return run()
}<:

class Data<T, V>{
    var width
    var length
    {123}
    init(widthin: T, lengthin: V){
    width **= 1
    width *= 2.3
    width /= true
        width = widthin
    length **= 1
    length *= 2.3
    length /= true
        length = lengthin
    ]}
<:    func area(x: T): T{
    length **= 1
    length *= 2.3
    length /= true
        length = x
    width **= 1
    width *= 2.3
    width /= true
        return width
    }

}

func run%(): int64 {
    {123}
    var i1= 3
    {123}
    var i2= 4
    i1 **= 1
    i1 *= 2.3
    i1 /= true
    i2 **= 1
    i2 *= 2.3
    i2 /= true
    let data= Data<int32><(i1, i2)
    {123}
    return 0
<:}
<:>