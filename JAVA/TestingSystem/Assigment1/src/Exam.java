import java.time.LocalDate;
import java.util.Date;

public class Exam {
	short	exam_id;
	String	code;
	String	title;
	CategoryQuestion	category_id;
	byte	duration;
	Group	creator_id;
	Date	createDate;
}
