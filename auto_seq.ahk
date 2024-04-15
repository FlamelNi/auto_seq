
CoordMode "Mouse", "Screen"

loc := []
loc_size := 0
origin := false

return

!o::
{
    global origin
    origin := !origin
}

!r::
{
    global loc
    global loc_size
    loc := []
    loc_size := 0
    origin := false
    return
}

!s::
{
    global loc
    global loc_size
    x := 0
    y := 0
    MouseGetPos &x, &y
    loc.push([x, y, 0])
    loc_size++
    return
}

!c::
{
    global loc
    global loc_size
    x := 0
    y := 0
    MouseGetPos &x, &y
    loc.push([x, y, 1])
    loc_size++
    return
}

!g::
{
    global loc
    global loc_size

    x0 := 0
    y0 := 0
    if origin
    {
        MouseGetPos &x0, &y0
    }
    i := 1
    while i < loc_size+1
    {
        MouseMove loc[i][1], loc[i][2]
        if loc[i][3] == 1
        {
            Click
        }
        Sleep 100
        i++
    }

    if origin
    {
        MouseMove x0, y0
    }
    return
}

!t::
{
    Click
}

