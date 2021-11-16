// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


internal let var536:Int16 = Int16(-104)
internal open class Class1390 <: Class14{
    public open func function1906():Bool{
       var536 < (var536>>(var536 & 7))
    }
    var var1838:Class32=Class32()
}
func main():Int64 {
    return 0
}

// ASSERT: scan  undeclared type name 'Class14'
// ASSERT: scan  undeclared type name 'Class32'