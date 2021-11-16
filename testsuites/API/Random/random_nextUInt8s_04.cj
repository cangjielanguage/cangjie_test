// EXEC: %compiler %stdx_cmp_opt  %f -o %output  2>&1 | compare %f

from std import util.*
from std import collection.*
func main()
{
   var seed:UInt64=15
   var r=Random(seed)
   var array1= Array<UInt16>([9,3,4,5,6,7,7])
   var array2= Array<UInt32>([9,3,4,5,6,7,7])
   var array3= Array<UInt64>([9,3,4,5,6,7,7])
   var array4= Array<Int8>([9,3,4,5,6,7,7])
   var array5= Array<Int16>([9,3,4,5,6,7,7])
   var array6= Array<Int32>([9,3,4,5,6,7,7])
   var array7= Array<Int64>([9,3,4,5,6,7,7])
   var list= List<UInt8>([9,3,4,5,6,7,7])
   var hashset= HashSet<UInt8>([9,3,4,5,6,7,7])
   var buffer= Buffer<UInt8>([9,3,4,5,6,7,7])
   r.nextUInt8s(array1)  // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   r.nextUInt8s(array2)  // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   r.nextUInt8s(array3)  // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   r.nextUInt8s(array4)  // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   r.nextUInt8s(array5)  // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   r.nextUInt8s(array6)  // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   r.nextUInt8s(array7)  // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   r.nextUInt8s(list)    // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   r.nextUInt8s(hashset) // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   r.nextUInt8s(buffer)  // EXPECTED: regex error.*?argument is mismatched with parameter type 'Array<UInt8>'
   return 0
}