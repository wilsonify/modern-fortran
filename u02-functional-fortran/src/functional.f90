module functional
  use iso_fortran_env, only: &
      i1 => int8,   i2 => int16,  i4 => int32,  i8 => int64, &
      r4 => real32, r8 => real64, r16 => real128

  use mod_arange
  use mod_arrstr
  use mod_complement
  use mod_empty
  use mod_filter
  use mod_foldl
  use mod_foldr
  use mod_foldt
  use mod_head
  use mod_init
  use mod_insert
  use mod_intersection
  use mod_iterfold
  use mod_last
  use mod_limit
  use mod_map
  use mod_reverse
  use mod_set
  use mod_sort
  use mod_split
  use mod_strarr
  use mod_subscript
  use mod_tail
  use mod_unfold
  use mod_union

  implicit none
  private

  public :: arange, arrstr, complement, empty, filter, foldl, foldr, foldt, head, &
             init, insert, intersection, iterfold, last, limit, map, reverse, set, &
             sort, split, strarr, subscript, tail, unfold, union

  public :: operator(.complement.), operator(.head.), operator(.init.), &
             operator(.intersection.), operator(.last.), operator(.reverse.), &
             operator(.set.), operator(.sort.), operator(.tail.), operator(.union.)

end module functional
