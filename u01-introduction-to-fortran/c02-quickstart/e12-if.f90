program ifs

    if (angle < 90.0) then
        print *, 'Angle is acute'
    end if

    if (angle < 90.0) then
        print *, 'Angle is acute'
    else
        print *, 'Angle is obtuse'
    end if

    if (angle < 90.0) then
        print *, 'Angle is acute'
    else if (angle < 180.0) then
        print *, 'Angle is obtuse'
    else
        print *, 'Angle is reflex'
    end if

end program ifs