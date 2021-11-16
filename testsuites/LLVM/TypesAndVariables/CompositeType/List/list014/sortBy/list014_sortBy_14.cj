// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C1{
        var height: Int64
        var age: Int64
        var meal: List<Int64>
        init(height:Int64,age:Int64,meal:List<Int64>){
                this.height = height
                this.age = age
                this.meal = meal
        }

}

func main(){
        var m_c1 = C1(150,23,[1,2,3])
        var m_c2 = C1(140,24,[1,2])
        var m_c3 = C1(180,25,[1,2,3,4])
        var people:List<C1> = [m_c1,m_c2,m_c3]

        var people_sort = people.sortBy({pl,pr=>pl.height<pr.height})
        print("${people_sort[0].height},${people_sort[1].height},${people_sort[2].height}.\n")

        var people_sort2 = people.sortBy({pl,pr=>pl.age<pr.age})
        print("${people_sort2[0].age},${people_sort2[1].age},${people_sort2[2].age}.\n")

        var people_sort3 = people.sortBy({pl,pr=>pl.meal.size()<pr.meal.size()})
        print("${people_sort3[0].meal},${people_sort3[1].meal},${people_sort3[2].meal}.\n")
	
	var bool1 = people_sort[0].height<people_sort[1].height && people_sort[1].height<people_sort[2].height
	var bool2 = people_sort2[0].age<people_sort2[1].age && people_sort2[1].age<people_sort2[2].age
	var bool3 = people_sort3[0].meal.size()<people_sort3[1].meal.size() && people_sort3[1].meal.size()<people_sort3[2].meal.size()
	
	if (bool1 && bool2 && bool3){
		return 0
	}
	return 1

}

