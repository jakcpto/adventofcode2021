Class dc.aoc2021.Day2 Extends dc.aoc2021.Utils
{

Parameter File = "input_2.txt";

ClassMethod task1() As %Integer
{
    set stream = ..getStream(..#File)
    set (forward, down) = 0

    while 'stream.AtEnd {
        set data = stream.ReadLine()
        if $piece(data, " ", 1 ) = "forward" { set forward = forward + $piece(data, " ", 2 ) }
        if $piece(data, " ", 1 ) = "down" { set down = down + $piece(data, " ", 2 ) }
        if $piece(data, " ", 1 ) = "up" { set down = down - $piece(data, " ", 2 ) }
    }

    return forward * down
}

ClassMethod task2() As %Integer
{
    set stream = ..getStream(..#File)
    set (forward, aim, depth) = 0

    while 'stream.AtEnd {
        set data = stream.ReadLine()
        if $piece(data, " ", 1 ) = "forward" { 
            set forward = forward + $piece(data, " ", 2 )
            set depth = depth + ($piece(data, " ", 2 ) * aim)
        }
        if $piece(data, " ", 1 ) = "down" { set aim = aim + $piece(data, " ", 2 ) }
        if $piece(data, " ", 1 ) = "up" { set aim = aim - $piece(data, " ", 2 ) }
    }

    return forward * depth
}

}
