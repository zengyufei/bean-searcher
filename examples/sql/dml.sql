INSERT INTO `teachers` (`id`, `name`) VALUES ('1', '李老师');
INSERT INTO `teachers` (`id`, `name`) VALUES ('2', '张老师');
INSERT INTO `teachers` (`id`, `name`) VALUES ('3', '王老师');

INSERT INTO `courses` (`id`, `name`, `credit`, `teacher_id`) VALUES ('1', '语文', '6', '1');
INSERT INTO `courses` (`id`, `name`, `credit`, `teacher_id`) VALUES ('2', '数学', '6', '2');
INSERT INTO `courses` (`id`, `name`, `credit`, `teacher_id`) VALUES ('3', '英语', '4', '3');
INSERT INTO `courses` (`id`, `name`, `credit`, `teacher_id`) VALUES ('4', '物理', '3', '2');
INSERT INTO `courses` (`id`, `name`, `credit`, `teacher_id`) VALUES ('5', '化学', '3', '2');
INSERT INTO `courses` (`id`, `name`, `credit`, `teacher_id`) VALUES ('6', '历史', '2', '1');
INSERT INTO `courses` (`id`, `name`, `credit`, `teacher_id`) VALUES ('7', '政治', '2', '1');
INSERT INTO `courses` (`id`, `name`, `credit`, `teacher_id`) VALUES ('8', '生物', '2', '3');
INSERT INTO `courses` (`id`, `name`, `credit`, `teacher_id`) VALUES ('9', '地理', '2', '3');

INSERT INTO `students` (`id`, `name`, `age`, `sex`) VALUES ('1', '小明', '1', '16');
INSERT INTO `students` (`id`, `name`, `age`, `sex`) VALUES ('2', '小红', '2', '16');
INSERT INTO `students` (`id`, `name`, `age`, `sex`) VALUES ('3', '小军', '1', '17');
INSERT INTO `students` (`id`, `name`, `age`, `sex`) VALUES ('4', '小芳', '2', '15');

INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('1', '1', '120');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('1', '2', '130');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('1', '3', '125');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('1', '4', '120');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('2', '1', '150');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('2', '2', '140');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('2', '3', '155');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('2', '4', '135');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('3', '1', '110');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('3', '2', '105');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('3', '3', '115');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('3', '4', '119');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('4', '1', '105');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('4', '2', '103');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('4', '3', '95');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('4', '4', '56');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('5', '1', '89');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('5', '2', '90');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('5', '3', '79');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('5', '4', '95');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('6', '1', '84');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('6', '2', '65');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('6', '3', '78');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('6', '4', '75');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('7', '1', '58');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('7', '2', '91');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('7', '3', '92');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('7', '4', '93');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('8', '1', '97');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('8', '2', '94');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('8', '3', '85');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('8', '4', '86');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('9', '1', '74');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('9', '2', '73');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('9', '3', '79');
INSERT INTO `student_course` (`course_id`, `student_id`, `score`) VALUES ('9', '4', '78');