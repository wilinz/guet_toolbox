class Course {
  Course({
    required this.id,
    required this.ctype,
    required this.tname,
    required this.examt,
    this.dptname,
    required this.dptno,
    required this.spname,
    required this.spno,
    required this.grade,
    required this.cname,
    required this.courseno,
    required this.teacherno,
    required this.name,
    required this.term,
    required this.courseid,
    this.croomno,
    this.comm,
    required this.startweek,
    required this.endweek,
    this.oddweek,
    required this.week,
    required this.seq,
    required this.maxcnt,
    required this.xf,
    required this.llxs,
    required this.syxs,
    required this.sjxs,
    required this.qtxs,
    required this.sctcnt,
    required this.hours,
  });

  late final int id;
  late final String ctype;
  late final String tname;
  late final String examt;
  late final Null dptname;
  late final String dptno;
  late final String spname;
  late final String spno;
  late final String grade;
  late final String cname;
  late final String courseno;
  late final String teacherno;
  late final String name;
  late final String term;
  late final String courseid;
  String? croomno;
  late final String? comm;
  late final int startweek;
  late final int endweek;
  late final Null oddweek;
  late final int week;
  late final String seq;
  late final int maxcnt;
  late final double xf;
  late final double llxs;
  late final double syxs;
  late final double sjxs;
  late final double qtxs;
  late final int sctcnt;
  late final int hours;

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ctype = json['ctype'];
    tname = json['tname'];
    examt = json['examt'];
    dptname = json['dptname'];
    dptno = json['dptno'];
    spname = json['spname'];
    spno = json['spno'];
    grade = json['grade'];
    cname = json['cname'];
    courseno = json['courseno'];
    teacherno = json['teacherno'];
    name = json['name'];
    term = json['term'];
    courseid = json['courseid'];
    croomno = json['croomno'];
    comm = json['comm'];
    startweek = json['startweek'];
    endweek = json['endweek'];
    oddweek = json['oddweek'];
    week = json['week'];
    seq = json['seq'];
    maxcnt = json['maxcnt'];
    xf = json['xf'];
    llxs = json['llxs'];
    syxs = json['syxs'];
    sjxs = json['sjxs'];
    qtxs = json['qtxs'];
    sctcnt = json['sctcnt'];
    hours = json['hours'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['ctype'] = ctype;
    _data['tname'] = tname;
    _data['examt'] = examt;
    _data['dptname'] = dptname;
    _data['dptno'] = dptno;
    _data['spname'] = spname;
    _data['spno'] = spno;
    _data['grade'] = grade;
    _data['cname'] = cname;
    _data['courseno'] = courseno;
    _data['teacherno'] = teacherno;
    _data['name'] = name;
    _data['term'] = term;
    _data['courseid'] = courseid;
    _data['croomno'] = croomno;
    _data['comm'] = comm;
    _data['startweek'] = startweek;
    _data['endweek'] = endweek;
    _data['oddweek'] = oddweek;
    _data['week'] = week;
    _data['seq'] = seq;
    _data['maxcnt'] = maxcnt;
    _data['xf'] = xf;
    _data['llxs'] = llxs;
    _data['syxs'] = syxs;
    _data['sjxs'] = sjxs;
    _data['qtxs'] = qtxs;
    _data['sctcnt'] = sctcnt;
    _data['hours'] = hours;
    return _data;
  }
}
