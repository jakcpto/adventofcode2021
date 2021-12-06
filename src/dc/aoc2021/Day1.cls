Class dc.aoc2021.Day1 Extends dc.aoc2021.Utils
{

Parameter File = "input_1.txt";

ClassMethod task1() As %Integer
{
    set data = ..getArray(..#File)
    set result = 0

    For i=0:1: (data.Count() - 1) {
        if data.GetAt(i) < data.GetNext(i) { 
            set result = $increment(result)
        }
    }

    return result
}

ClassMethod task2() As %Integer
{
    set data = ..getArray(..#File)
    set result = 0

    For i=0:1: (data.Count() - 1) {
        set curr = data.GetAt(i) + data.GetAt(i + 1) + data.GetAt(i + 2)
        set prev = data.GetAt(i + 1) + data.GetAt(i + 2) + data.GetAt(i + 3)
        if prev > curr { set result = $increment(result) }
    }

    return result
}

}
