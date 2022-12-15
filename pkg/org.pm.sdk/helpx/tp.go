package helpx

import "unsafe"


/**
 * $(bool2int)
 * @Description:
 * @param x
 * @return int
 */
func bool2int(x bool) int {
    return int(uint8(*(*uint8)(unsafe.Pointer(&x))))
}

/**
 * $(alignDown)
 * @Description:
 * @param x
 * @param a
 * @return uintptr
 */
func alignDown(x, a uintptr) uintptr {
    return x &^ (a - 1)
}

/**
 * $(alignUp)
 * @Description:
 * @param x
 * @param a
 * @return uintptr
 */
func alignUp(x, a uintptr) uintptr {
    return (x + a - 1) &^ (a - 1)
}

/**
 * $(divRoundUp)
 * @Description:
 * @param n
 * @param a
 * @return uintptr
 */
func divRoundUp(n, a uintptr) uintptr {
    return (n + a - 1) / a
}

/**
 * $(isPowerOfTwo)
 * @Description:
 * @param x
 * @return bool
 */
func isPowerOfTwo(x uintptr) bool {
    return x&(x-1) == 0
}
