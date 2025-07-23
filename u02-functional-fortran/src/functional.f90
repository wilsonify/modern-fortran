module functional
    use iso_fortran_env, only : &
            i1 => int8, i2 => int16, i4 => int32, i8 => int64, &
            r4 => real32, r8 => real64, r16 => real128

    use mod_compare
    use mod_empty
    use mod_head
    use mod_init
    use mod_last
    use mod_limit
    use mod_logical
    use mod_tail
    use mod_arange
    use mod_sort
    use mod_str
    use mod_insert
    use mod_reverse
    use mod_split
    use mod_set
    use mod_complement
    use mod_filter
    use mod_intersection
    use mod_union
    use mod_foldl
    use mod_foldr
    use mod_foldt
    use mod_iterfold
    use mod_map
    use mod_subscript
    use mod_unfold

end module functional
