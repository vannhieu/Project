import java.time.LocalDate;
import java.util.Date;

public class Question {
	short				question_id;
	String				content;
	CategoryQuestion	category_id;
	TypeQuestion		type_id;
	Group				creator_id;
	Date				createDate;
}
