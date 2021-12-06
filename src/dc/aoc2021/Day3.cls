Class dc.aoc2021.Day3 Extends dc.aoc2021.Utils
{

Parameter File = "input_3.txt";

ClassMethod task1() As %Integer
{
    return ..BinToDec(..getGammaEpsilon("gamma")) * ..BinToDec(..getGammaEpsilon("epsilon"))
}

ClassMethod task2() As %Integer
{
    return ..BinToDec(..getOxygenEepsilon("oxygen")) * ..BinToDec(..getOxygenEepsilon("oc2"))
}

ClassMethod getOxygenEepsilon(type)
{
    set data = ..getArray(..#File)
    if type = "oxygen" { set a = 1 set b = 0 set c = 1 }
    if type = "oc2" { set a = 0 set b = 1 set c = 0 }

    for i=1:1: $LENGTH(data.GetAt(0)){
        set (zero, compare) = 0
        set iter = -1

        for j=0:1: (data.Count()) + 1 {
            if $EXTRACT(data.GetAt(j), i) = 0 { set zero = $I(zero) }
        }

        if zero < (data.Count() / 2) { set compare = a }
        if zero > (data.Count() / 2) { set compare = b }
        if zero = (data.Count() / 2) { set compare = c }

        For j=0:1: (data.Count()) + 1 {
            if $EXTRACT(data.GetAt(j), i) = compare {
                set iter = $I(iter)
                do data.SetAt(data.GetAt(j), iter)
            }

            if iter '= j { do data.RemoveAt(j) }
        }
        if data.Count() = 1 { return data.GetNext() }
    }

    zwrite data
}

ClassMethod getGammaEpsilon(data)
{
    set stream = ..getStream(..#File)
    set (gamma, epsilon) = ""

    for i=1:1: $LENGTH(stream.ReadLine()) - 1{
        set temp = ""
        while 'stream.AtEnd {
            set temp = temp_$EXTRACT(stream.ReadLine(), i)
        }
        do stream.Rewind()
        if $LENGTH(temp, "1") > $LENGTH(temp, "0") { 
            set gamma = gamma_"1"
            set epsilon = epsilon_"0"
        }
        else { 
            set gamma = gamma_"0" 
            set epsilon = epsilon_"1"
        }
    }

    if (data = "gamma") return gamma
    if (data = "epsilon") return epsilon
}

ClassMethod BinToDec(bin) As %Integer
{
    set res=0
    for i=1:1:$length(bin) set res=res*2+$extract(bin,i)
    return res
}

}
