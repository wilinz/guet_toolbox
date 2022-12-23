import java.util.*

object CAS {
    val R = Arrays.asList(
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
    )
    val J = Arrays.asList("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f")
    val V = Arrays.asList(0, 1, 3, 7, 15, 31, 63, 127, 255, 511, 1023, 2047, 4095, 8191, 16383, 32767, 65535)

    /* JADX INFO: Access modifiers changed from: private */
    fun Bool(i2: Int): Boolean {
        return i2 != 0
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun Number(b: Boolean): Int {
        return if (b) 1 else 0
    }

    private fun <T> vpn_get_obj(ary: List<T>, index: Int): T {
        return ary[index]
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun <T> vpn_set_obj(ary: MutableList<T>, index: Int, value: T) {
        while (index >= ary.size) {
            ary.add(value)
        }
        ary[index] = value
    }

    private fun vpn_plus_assign_obj(ary: MutableList<Int?>, index: Int, value: Int) {
        while (index >= ary.size) {
            ary.add(0)
        }
        ary[index] = ary[index]!!.toInt() + value
    }

    private fun vpn_shift_right_assign_obj(ary: MutableList<Int?>, index: Int, value: Int) {
        while (index >= ary.size) {
            ary.add(0)
        }
        ary[index] = ary[index]!!.toInt() ushr value
    }

    private fun s(e: String): String {
        var str = ""
        for (length in e.length - 1 downTo -1 + 1) {
            str = str + e[length]
        }
        return str
    }

    private fun l(e: Int): String {
        var e = e
        var str = ""
        for (i2 in 0..3) {
            str = str + vpn_get_obj(J, e and 15) as String
            e = e ushr 4
        }
        return s(str)
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun h(e: i): Int {
        var size = e.digits.size - 1
        while (size > 0 && vpn_get_obj(e.digits, size)!!.toInt() == 0) {
            size--
        }
        return size
    }

    private fun u(e: i): String {
        h(e)
        var str = ""
        for (h in h(e) downTo -1 + 1) {
            str = str + l(vpn_get_obj(e.digits, h)!!.toInt())
        }
        return str
    }

    private fun b(e: List<Int?>, t: Int, n: MutableList<Int?>, a: Int, i2: Int) {
        var t = t
        var a = a
        val min = Math.min(i2 + t, e.size)
        while (t < min) {
            vpn_set_obj(n, a, vpn_get_obj(e, t))
            t++
            a++
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun T(e: i, t: Int): i {
        val floor = Math.floor(t / 16.0).toInt()
        val iVar = i()
        var i2 = 0
        b(e.digits, floor, iVar.digits, 0, e.digits.size - floor)
        val i3 = t % 16
        val i4 = 16 - i3
        var i5 = 1
        while (i2 < iVar.digits.size - 1) {
            vpn_set_obj(
                iVar.digits, i2, Integer.valueOf(
                    vpn_get_obj(iVar.digits, i2)!!.toInt() ushr i3 or (vpn_get_obj(
                        iVar.digits,
                        i5
                    )!!.toInt() and (vpn_get_obj(
                        V, i3
                    ) as Int).toInt() shl i4)
                )
            )
            i2++
            i5++
        }
        vpn_shift_right_assign_obj(iVar.digits, iVar.digits.size - 1, i3)
        iVar.isNeg = e.isNeg
        return iVar
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun g(e: i, t: i): i {
        if (e.isNeg != t.isNeg) {
            t.isNeg = !t.isNeg
            val f = f(e, t)
            t.isNeg = !t.isNeg
            return f
        }
        val iVar = i()
        var i2 = 0
        for (i3 in e.digits.indices) {
            val intValue = vpn_get_obj(e.digits, i3)!!.toInt() - vpn_get_obj(t.digits, i3)!!.toInt() + i2
            vpn_set_obj(iVar.digits, i3, Integer.valueOf(intValue % 65536))
            if (vpn_get_obj(iVar.digits, i3)!!.toInt() < 0) {
                vpn_plus_assign_obj(iVar.digits, i3, 65536)
            }
            i2 = 0 - if (intValue < 0) 1 else 0
        }
        if (-1 == i2) {
            var i4 = 0
            for (i5 in e.digits.indices) {
                val intValue2 = 0 - vpn_get_obj(iVar.digits, i5)!!.toInt() + i4
                vpn_set_obj(iVar.digits, i5, Integer.valueOf(intValue2 % 65536))
                if (vpn_get_obj(iVar.digits, i5)!!.toInt() < 0) {
                    vpn_plus_assign_obj(iVar.digits, i5, 65536)
                }
                i4 = 0 - if (intValue2 < 0) 1 else 0
            }
            iVar.isNeg = !e.isNeg
        } else {
            iVar.isNeg = e.isNeg
        }
        return iVar
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun f(e: i, t: i): i {
        if (e.isNeg != t.isNeg) {
            t.isNeg = !t.isNeg
            val g = g(e, t)
            t.isNeg = !t.isNeg
            return g
        }
        val iVar = i()
        var i2 = 0
        for (i3 in e.digits.indices) {
            val intValue = vpn_get_obj(e.digits, i3)!!.toInt() + vpn_get_obj(t.digits, i3)!!.toInt() + i2
            vpn_set_obj(iVar.digits, i3, Integer.valueOf(intValue % 65536))
            i2 = if (intValue >= 65536) 1 else 0
        }
        iVar.isNeg = e.isNeg
        return iVar
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun x(e: i, t: Int): i {
        val iVar = i()
        b(e.digits, t, iVar.digits, 0, iVar.digits.size - t)
        return iVar
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun O(e: i, t: Int): i {
        val iVar = i()
        b(e.digits, 0, iVar.digits, 0, t)
        return iVar
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun k(e: i, t: i): Int {
        if (e.isNeg != t.isNeg) {
            return 1 - (if (e.isNeg) 1 else 0) * 2
        }
        var size = e.digits.size - 1
        while (true) {
            if (size < 0) {
                return 0
            }
            if (vpn_get_obj(e.digits, size) !== vpn_get_obj(t.digits, size)) {
                val z = e.isNeg
                val intValue = vpn_get_obj(e.digits, size)!!.toInt()
                val intValue2 = vpn_get_obj(t.digits, size)!!.toInt()
                return if (z) {
                    1 - (if (intValue > intValue2) 1 else 0) * 2
                } else 1 - Number(intValue < intValue2) * 2
            }
            size--
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    fun E(e: i, t: i): i {
        val iVar = i()
        val h = h(e)
        val h2 = h(t)
        for (i2 in 0..h2) {
            var i3 = 0
            var i4 = 0
            var i5 = i2
            while (i3 <= h) {
                val intValue =
                    vpn_get_obj(iVar.digits, i5)!!.toInt() + vpn_get_obj(e.digits, i3)!!.toInt() * vpn_get_obj(
                        t.digits,
                        i2
                    )!!.toInt() + i4
                vpn_set_obj(iVar.digits, i5, Integer.valueOf(65535 and intValue))
                i4 = intValue ushr 16
                i3++
                i5++
            }
            vpn_set_obj(iVar.digits, i2 + h + 1, Integer.valueOf(i4))
        }
        iVar.isNeg = e.isNeg != t.isNeg
        return iVar
    }

    private fun get_for_L(): for_L {
        return for_L(
            i(
                Arrays.asList(
                    1,
                    1,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                ), false
            ), i(
                Arrays.asList(
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                ), false
            ), i(
                Arrays.asList(
                    59313,
                    4375,
                    54507,
                    5267,
                    8345,
                    43610,
                    49971,
                    28563,
                    34983,
                    36521,
                    17297,
                    62027,
                    42744,
                    32131,
                    40043,
                    48417,
                    5636,
                    46659,
                    52373,
                    20768,
                    28635,
                    46498,
                    55076,
                    13948,
                    44453,
                    44804,
                    40613,
                    1466,
                    26896,
                    54350,
                    28506,
                    28712,
                    44726,
                    4974,
                    46852,
                    32655,
                    60720,
                    2973,
                    7722,
                    43040,
                    10398,
                    28111,
                    52739,
                    6542,
                    43865,
                    20892,
                    59308,
                    8898,
                    58877,
                    36302,
                    41921,
                    27719,
                    59291,
                    10923,
                    8559,
                    53747,
                    10707,
                    59976,
                    48415,
                    32958,
                    37390,
                    57449,
                    45414,
                    46574,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                ), false
            ), 126, 16, for_L_barrett(
                i(
                    Arrays.asList(
                        59313,
                        4375,
                        54507,
                        5267,
                        8345,
                        43610,
                        49971,
                        28563,
                        34983,
                        36521,
                        17297,
                        62027,
                        42744,
                        32131,
                        40043,
                        48417,
                        5636,
                        46659,
                        52373,
                        20768,
                        28635,
                        46498,
                        55076,
                        13948,
                        44453,
                        44804,
                        40613,
                        1466,
                        26896,
                        54350,
                        28506,
                        28712,
                        44726,
                        4974,
                        46852,
                        32655,
                        60720,
                        2973,
                        7722,
                        43040,
                        10398,
                        28111,
                        52739,
                        6542,
                        43865,
                        20892,
                        59308,
                        8898,
                        58877,
                        36302,
                        41921,
                        27719,
                        59291,
                        10923,
                        8559,
                        53747,
                        10707,
                        59976,
                        48415,
                        32958,
                        37390,
                        57449,
                        45414,
                        46574,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                    ), false
                ), 64, i(
                    Arrays.asList(
                        7469,
                        13822,
                        15506,
                        32982,
                        50429,
                        62979,
                        64339,
                        60597,
                        40979,
                        61913,
                        20952,
                        38396,
                        43669,
                        60926,
                        10345,
                        21166,
                        11931,
                        31731,
                        17652,
                        54018,
                        14346,
                        5098,
                        29577,
                        27601,
                        14064,
                        33529,
                        25220,
                        39088,
                        8044,
                        19738,
                        21550,
                        5198,
                        30005,
                        21337,
                        934,
                        14453,
                        28049,
                        17274,
                        16321,
                        32160,
                        3193,
                        55263,
                        27029,
                        41238,
                        14094,
                        25353,
                        47316,
                        6175,
                        31709,
                        27325,
                        36707,
                        32884,
                        7478,
                        49873,
                        62514,
                        44522,
                        9303,
                        45997,
                        33566,
                        1250,
                        26644,
                        59158,
                        49823,
                        26680,
                        1,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                    ), false
                ), i(
                    Arrays.asList(
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                    ), false
                )
            )
        )
    }

    private fun L(e: for_L, t: String): String {
        val arrayList: ArrayList<Int> = ArrayList<Int>()
        val length = t.length
        for (i2 in 0 until length) {
            arrayList.add(Integer.valueOf(t.codePointAt(i2)))
        }
        while (arrayList.size % e.chunkSize != 0) {
            arrayList.add(0)
        }
        val size = arrayList.size
        val sb = StringBuilder()
        var i3 = 0
        while (i3 < size) {
            val iVar = i()
            var i4 = 0
            var i5 = i3
            while (i5 < e.chunkSize + i3) {
                val i6 = i5 + 1
                vpn_set_obj(iVar.digits, i4, vpn_get_obj(arrayList, i5) as Int)
                vpn_plus_assign_obj(iVar.digits, i4, (vpn_get_obj(arrayList, i6) as Int).toInt() shl 8)
                i4++
                i5 = i6 + 1
            }
            sb.append(u(e.barrett.powMod(iVar, e.e)))
            sb.append(" ")
            i3 += e.chunkSize
        }
        return sb.substring(0, sb.toString().length - 1)
    }

    fun encrypt(text: String): String {
        return L(get_for_L(), text)
    }

    /* JADX INFO: Access modifiers changed from: private */ /* loaded from: classes.dex */
    class i {
        var digits: MutableList<Int?>
        var isNeg: Boolean

        constructor() {
            digits = LinkedList<Int?>(R)
            isNeg = false
        }

        constructor(digits: MutableList<Int?>, isNeg: Boolean) {
            this.digits = digits
            this.isNeg = isNeg
        }
    }

    /* JADX INFO: Access modifiers changed from: private */ /* loaded from: classes.dex */
    class for_L_barrett(var modulus: i, var k: Int, var mu: i, var bkplus1: i) {
        fun modulo(e: i): i {
            var g = g(O(e, k + 1), O(E(x(E(x(e, k - 1), mu), k + 1), modulus), k + 1))
            if (g.isNeg) {
                g = f(g, bkplus1)
            }
            var Number = Number(k(g, modulus) >= 0)
            while (Bool(Number)) {
                g = g(g, modulus)
                Number = Number(k(g, modulus) >= 0)
            }
            return g
        }

        fun multiplyMod(e: i, t: i): i {
            return modulo(E(e, t))
        }

        fun powMod(e: i, t: i): i {
            var e = e
            var t = t
            var iVar = i()
            vpn_set_obj(iVar.digits, 0, 1)
            while (true) {
                if (t.digits[0]!!.toInt() and 1 != 0) {
                    iVar = multiplyMod(iVar, e)
                }
                t = T(t, 1)
                if (t.digits[0]!!.toInt() == 0 && h(t) == 0) {
                    return iVar
                }
                e = multiplyMod(e, e)
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */ /* loaded from: classes.dex */
    class for_L(var e: i, var d: i, var m: i, var chunkSize: Int, var radix: Int, var barrett: for_L_barrett)
}