import 'dart:math' as math;

@Deprecated('old old system')
class CAS {
  static final List<int> _R = List<int>.generate(131, (index) => 0);

  static final List<String> _J = "0123456789abcdef".split("");

  static final List<int> _V = [
    0,
    1,
    3,
    7,
    15,
    31,
    63,
    127,
    255,
    511,
    1023,
    2047,
    4095,
    8191,
    16383,
    32767,
    65535
  ].toList();

  static bool _Bool(int i2) {
    return i2 != 0;
  }

  static int _Number(bool b) {
    return b ? 1 : 0;
  }

  static T _vpn_get_obj<T>(List<T> ary, int index) {
    return ary[index];
  }

  static void _vpn_set_obj<T>(List<T> ary, int index, T value) {
    while (index >= ary.length) {
      ary.add(value);
    }
    ary[index] = value;
  }

  static void _vpn_plus_assign_obj<T>(List<int> ary, int index, int value) {
    while (index >= ary.length) {
      ary.add(0);
    }
    ary[index] = ary[index] + value;
  }

  static void _vpn_shift_right_assign_obj<T>(List<int> ary, int index,
      int value) {
    while (index >= ary.length) {
      ary.add(0);
    }
    ary[index] = ary[index] >> value;
  }

  static String _s(String e) {
    String str = "";
    for (int length = e.length - 1; length > -1; length--) {
      str = str + String.fromCharCode(e.codeUnitAt(length));
    }
    return str;
  }

  static String _l(int e) {
    String str = "";
    for (int i2 = 0; i2 < 4; i2++) {
      str = str + _vpn_get_obj(_J, e & 15);
      e
    >>>= 4;
    }
    return _s(str);
  }

  static int _h(_IClass e) {
    int size = e.digits.length - 1;
    while (size > 0 && (_vpn_get_obj(e.digits, size)) == 0) {
      size--;
    }
    return size;
  }

  static String _u(_IClass e) {
    _h(e);
    String str = "";
    for (int h0 = _h(e); h0 > -1; h0--) {
      str = str + _l((_vpn_get_obj(e.digits, h0)));
    }
    return str;
  }

  static void _b(List<int> e, int t, List<int> n, int a, int i2) {
    int min = math.min(i2 + t, e.length);
    while (t < min) {
      _vpn_set_obj(n, a, _vpn_get_obj(e, t));
      t++;
      a++;
    }
  }

  static _IClass _T(_IClass e, int t) {
    int floor = (t / 16.0).floor();
    _IClass iVar = _IClass();
    int i2 = 0;
    _b(e.digits, floor, iVar.digits, 0, e.digits.length - floor);
    int i3 = t % 16;
    int i4 = 16 - i3;
    int i5 = 1;
    while (i2 < iVar.digits.length - 1) {
      _vpn_set_obj(
          iVar.digits,
          i2,
          (((_vpn_get_obj(iVar.digits, i2)) >>> i3) |
          (((_vpn_get_obj(iVar.digits, i5)) & (_vpn_get_obj(_V, i3))) << i4)));
      i2++;
      i5++;
    }
    _vpn_shift_right_assign_obj(iVar.digits, iVar.digits.length - 1, i3);
    iVar.isNeg = e.isNeg;
    return iVar;
  }

  static _IClass _g(_IClass e, _IClass t) {
    if (e.isNeg != t.isNeg) {
      t.isNeg = !t.isNeg;
      _IClass f0 = _f(e, t);
      t.isNeg = !t.isNeg;
      return f0;
    }
    _IClass iVar = new _IClass();
    int i2 = 0;
    for (int i3 = 0; i3 < e.digits.length; i3++) {
      int intValue = _vpn_get_obj(e.digits, i3).toInt() -
          _vpn_get_obj(t.digits, i3).toInt() +
          i2;
      _vpn_set_obj(iVar.digits, i3, (intValue % 65536));
      if (_vpn_get_obj(iVar.digits, i3) < 0) {
        _vpn_plus_assign_obj(iVar.digits, i3, 65536);
      }
      i2 = 0 - (intValue < 0 ? 1 : 0);
    }
    if (-1 == i2) {
      int i4 = 0;
      for (int i5 = 0; i5 < e.digits.length; i5++) {
        int intValue2 = 0 - _vpn_get_obj(iVar.digits, i5).toInt() + i4;
        _vpn_set_obj(iVar.digits, i5, intValue2 % 65536);
        if (_vpn_get_obj(iVar.digits, i5) < 0) {
          _vpn_plus_assign_obj(iVar.digits, i5, 65536);
        }
        i4 = 0 - (intValue2 < 0 ? 1 : 0);
      }
      iVar.isNeg = !e.isNeg;
    } else {
      iVar.isNeg = e.isNeg;
    }
    return iVar;
  }

  static _IClass _f(_IClass e, _IClass t) {
    if (e.isNeg != t.isNeg) {
      t.isNeg = !t.isNeg;
      _IClass g0 = _g(e, t);
      t.isNeg = !t.isNeg;
      return g0;
    }
    _IClass iVar = new _IClass();
    int i2 = 0;
    for (int i3 = 0; i3 < e.digits.length; i3++) {
      int intValue = (_vpn_get_obj(e.digits, i3)).toInt() +
          (_vpn_get_obj(t.digits, i3)).toInt() +
          i2;
      _vpn_set_obj(iVar.digits, i3, intValue % 65536);
      i2 = intValue >= 65536 ? 1 : 0;
    }
    iVar.isNeg = e.isNeg;
    return iVar;
  }

  static _IClass _x(_IClass e, int t) {
    _IClass iVar = new _IClass();
    _b(e.digits, t, iVar.digits, 0, iVar.digits.length - t);
    return iVar;
  }

  static _IClass _O(_IClass e, int t) {
    _IClass iVar = new _IClass();
    _b(e.digits, 0, iVar.digits, 0, t);
    return iVar;
  }

  static int _k(_IClass e, _IClass t) {
    if (e.isNeg != t.isNeg) {
      return 1 - ((e.isNeg ? 1 : 0) * 2);
    }
    int size = e.digits.length - 1;
    while (true) {
      if (size < 0) {
        return 0;
      }
      if (_vpn_get_obj(e.digits, size) != _vpn_get_obj(t.digits, size)) {
        bool z = e.isNeg;
        int intValue = (_vpn_get_obj(e.digits, size));
        int intValue2 = _vpn_get_obj(t.digits, size);
        if (z) {
          return 1 - ((intValue > intValue2 ? 1 : 0) * 2);
        }
        return 1 - (_Number(intValue < intValue2) * 2);
      }
      size--;
    }
  }

  /* JADX INFO: Access modifiers changed from: private */
  static _IClass _E(_IClass e, _IClass t) {
    _IClass iVar = new _IClass();
    int h0 = _h(e);
    int h2 = _h(t);
    for (int i2 = 0; i2 <= h2; i2++) {
      int i3 = 0;
      int i4 = 0;
      int i5 = i2;
      while (i3 <= h0) {
        int intValue = ((_vpn_get_obj(iVar.digits, i5).toInt() +
            (_vpn_get_obj(e.digits, i3).toInt() * _vpn_get_obj(t.digits, i2))
                .toInt() +
            i4));
        _vpn_set_obj(iVar.digits, i5, (65535 & intValue.toInt()));
        i4 = intValue.toInt() >>> 16;
        i3++;
        i5++;
      }
      _vpn_set_obj(iVar.digits, i2 + h0 + 1, i4);
    }
    iVar.isNeg = e.isNeg != t.isNeg;
    return iVar;
  }

  static _ForLClass _get_for_L() {
    var a = _IClass(
        digits: List<int>.generate(131, (index) => index < 2 ? 1 : 0),
        isNeg: false);
    var b = _IClass(
        digits: List<int>.generate(131, (index) => 0),
        isNeg: false);
    var c = _IClass(
        digits: [
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
        ].toList(),
        isNeg: false);
    var d = _IClass(
        digits: [
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
        ].toList(),
        isNeg: false);
    var e = _IClass(
        digits: [
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
        ].toList(),
        isNeg: false);
    var f = _IClass(
        digits: List<int>.generate(131, (index) => index == 65 ? 1 : 0),
        isNeg: false);
    return _ForLClass(a, b, c, 126, 16, _ForLBarrettClass(d, 64, e, f));
  }

  static String _L(_ForLClass e, String t) {
    List<int> arrayList = List.empty(growable: true);
    int length = t.length;
    for (int i2 = 0; i2 < length; i2++) {
      arrayList.add(t.codeUnitAt(i2));
    }
    while (arrayList.length % e.chunkSize != 0) {
      arrayList.add(0);
    }
    int size = arrayList.length;
    var sb = "";
    int i3 = 0;
    while (i3 < size) {
      _IClass iVar = new _IClass();
      int i4 = 0;
      int i5 = i3;
      while (i5 < e.chunkSize + i3) {
        int i6 = i5 + 1;
        _vpn_set_obj(iVar.digits, i4, _vpn_get_obj(arrayList, i5));
        _vpn_plus_assign_obj(iVar.digits, i4, (_vpn_get_obj(arrayList, i6)) << 8);
        i4++;
        i5 = i6 + 1;
      }
      var a = e.barrett.powMod(iVar, e.e);
      var b = _u(a);
      sb += (b);
      sb += (" ");
      i3 += e.chunkSize;
    }
    return sb.substring(0, sb
        .toString()
        .length - 1);
  }

  static String encrypt(String text) {
    return _L(_get_for_L(), text);
  }
}

class _IClass {
  List<int> digits = List<int>.from(CAS._R);
  bool isNeg = false;

  _IClass({digits, isNeg}) {
    if (digits != null) this.digits = digits;
    if (isNeg != null) this.isNeg = isNeg;
  }
}

class _ForLClass {
  _ForLBarrettClass barrett;
  int chunkSize;
  _IClass d;
  _IClass e;
  _IClass m;
  int radix;

  _ForLClass(this.e, this.d, this.m, this.chunkSize, this.radix, this.barrett);
}

class _ForLBarrettClass {
  _IClass bkplus1;
  int k;
  _IClass modulus;
  _IClass mu;

  _ForLBarrettClass(this.modulus, this.k, this.mu, this.bkplus1);

  _IClass modulo(_IClass e) {
    _IClass g = CAS._g(CAS._O(e, k + 1),
        CAS._O(CAS._E(CAS._x(CAS._E(CAS._x(e, k - 1), mu), k + 1), modulus), k + 1));
    if (g.isNeg) {
      g = CAS._f(g, bkplus1);
    }
    int Number = CAS._Number(CAS._k(g, modulus) >= 0);
    while (CAS._Bool(Number)) {
      g = CAS._g(g, modulus);
      Number = CAS._Number(CAS._k(g, modulus) >= 0);
    }
    return g;
  }

  _IClass multiplyMod(_IClass e, _IClass t) {
    return modulo(CAS._E(e, t));
  }

  _IClass powMod(final _IClass e5, _IClass t) {
    var e1 = e5;
    _IClass iVar = _IClass();
    CAS._vpn_set_obj(iVar.digits, 0, 1);
    while (true) {
      if ((t.digits[0] & 1) != 0) {
        iVar = multiplyMod(iVar, e1);
      }
      t = CAS._T(t, 1);
      if (t.digits[0] == 0 && CAS._h(t) == 0) {
        return iVar;
      }
      e1 = multiplyMod(e1, e1);
    }
  }
}
