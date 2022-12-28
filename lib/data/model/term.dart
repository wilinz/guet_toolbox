class Term {
  Term({
    required this.term,
    required this.startdate,
    required this.enddate,
    required this.weeknum,
    required this.termname,
    required this.schoolyear,
    this.comm,
  });

  late final String term;
  late final String startdate;
  late final String enddate;
  late final String weeknum;
  late final String termname;
  late final String schoolyear;
  String? comm;

  Term.fromJson(Map<String, dynamic> json) {
    term = json['term'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    weeknum = json['weeknum'];
    termname = json['termname'];
    schoolyear = json['schoolyear'];
    comm = json['comm'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['term'] = term;
    _data['startdate'] = startdate;
    _data['enddate'] = enddate;
    _data['weeknum'] = weeknum;
    _data['termname'] = termname;
    _data['schoolyear'] = schoolyear;
    _data['comm'] = comm;
    return _data;
  }
}
