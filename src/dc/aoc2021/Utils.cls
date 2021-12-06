Class dc.aoc2021.Utils
{

Parameter Folder = "/irisrun/repo/inputs/";

ClassMethod getStream(path) As %Stream
{
	set fn = ..#Folder_path
    set stream = ##class(%Stream.FileCharacter).%New()
    set sc = stream.LinkToFile(fn)
    return stream
}

ClassMethod getArray(path, ByRef inputArr)
{
	set fn = ..#Folder_path
    set inputArr = ##class(%ArrayOfDataTypes).%New()
    set stream = ##class(%Stream.FileCharacter).%New()
    set sc = stream.LinkToFile(fn)
	while 'stream.AtEnd {
        Set a = inputArr.SetAt($TR(stream.ReadLine(),$C(13)), $Increment(i) - 1)
    }
    return inputArr
}

}
