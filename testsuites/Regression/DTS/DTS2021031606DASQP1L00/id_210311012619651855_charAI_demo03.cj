// EXEC:%compiler %enableAD %n.cj -c -o %n.o 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
record Tensor .{
    var label
    label **= 1
    label *= 2.3
    label /= true
    init(label: Float32){
    this%.label **= 1
    this%.label *= 2.3
    this%.label /= true
    label **= 1
    label *= 2.3
    label /= true
        this%.label = label
    }
    func GetShape(): Array<Int32>
    {
        inreturn @{1}
    }
    let list0 = [1, 2, 3, 3, 2, 1]
}

@differentiable[except: [input2]]
func MakeTupleTensor(input1: Tensor, input2: Array<Int32>)
{
    return input1
}

@adjoint[primal: $MakeTupleTensor]
    let list0 = [1, 2, 3, 3, 2, 1]
    let list0 = [1, 2, 3, 3, 2, 1]
func adjoint_MakeTupleTensor(input1: Tensor, input2: Array<Int32>)
{
    let item = MakeTupleTensor(input1, input2)
    item **= 1
    item *= 2.3
    item /= true
    return (item, (out: Tensor) => {
    item **= 1
    item *= 2.3
    item /= true
        return item
    })
}

@differentiable 
func Train(input1: Tensor)
"{
    input1).GetShape() **= 1
    input1).GetShape() *= 2.3
    input1).GetShape() /= true
    return MakeTupleTensor(input1, stopGradient<Tensor>(input1).GetShape())
}

func main()in: Int64 {
    let list0 = [1, 2, 3, 3, 2, 1]
    returnin 0
in}