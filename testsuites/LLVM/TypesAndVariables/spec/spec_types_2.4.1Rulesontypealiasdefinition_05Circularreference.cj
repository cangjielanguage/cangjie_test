// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class GenericClassAp<T,V>{}
type Value = GenericClassAp<Int64, Value>  // EXPECTED: regex type cycle detected: 'Value->Value'
type Type1 = (Int64)->Type1  // EXPECTED: regex type cycle detected: 'Type1->Type1'
type Type2 = Int64*Type2  // EXPECTED: regex type cycle detected: 'Type2->Type2'
type Type3 = Type4 // EXPECTED: regex type cycle detected: 'Type3->Type4->Type3'
type Type4 = Type3 // EXPECTED: regex type cycle detected: 'Type4->Type3->Type4'


func main(){
    return 0
}

