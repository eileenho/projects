function Student(fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
}

Student.prototype.name = function() {
  return `${this.fname} ${this.lname}`;
};

Student.prototype.courses = function() {
  return this.courses.keys;
};

Student.protoype.enroll = function(course) {
  this.courses.push(course);
  course.addStudent(this);
};

Student.prototype.courseload = function() {
  const load = {};
  this.course.forEach(course => {
    load[course.department] = load[course.department] || 0;
    load[course.department] += course.credits;
  });
};


function Course(name, department, credits) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
}

Course.prototype.students = function() {
  return this.students;
};

Course.prototype.addStudent = function(student) {
  student.enroll(this);
};
