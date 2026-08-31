from merge_sort import merge_sort


def test_constant_input_array_sort():
    arr = [3, 1, 4, 1, 5, 9, 2, 6]
    res = merge_sort(arr)
    assert(res == [1, 1, 2, 3, 4, 5, 6, 9])

def test_multiple_element_sort():
    arr = [3, 4, 5, 5, 1, 2, 3, 7, 8]
    res = merge_sort(arr)
    assert(res == [1, 2, 3, 3, 4, 5, 5, 7, 8])