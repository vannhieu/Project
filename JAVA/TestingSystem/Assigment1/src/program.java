import java.util.Date;

public class program {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		
		// create department	
		Department D = new Department();
		D.department_id = 1;
		D.department_name = "sale";
		
		Department D1 = new Department();
		D1.department_id = 2;
		D1.department_name = "Marketing";
		
		// create position
		
		Position P = new Position();
		P.position_id = 1;
		P.position_name = "java fresher";
		
		Position P1 = new Position();
		P1.position_id = 2;
		P1.position_name = "C# fresher";
		
		// create Account
		
		Account A = new Account();
		A.account_id = 1;
		A.email 	= "NguyenVanA@gmail.com";
		A.fullname = "Nguyen Van A";
		A.userName = "A";
		A.department_id = D;
		A.position_id = P;
		A.createDate = new Date("2000/02/12");
		
		// create group
		Group G = new Group();
		G.group_id = 1;
		G.group_name ="group 1";
		G.creator_id = 1;
		G.createDate = new Date("2000/03/05");
		
		
		// create GroupAcount
		
		GroupAccount GA = new GroupAccount();
		GA.Account_id = A;
		GA.Group_id = G;
		
		// create TypeQuestion
		
		TypeQuestion TQ = new TypeQuestion();
		TQ.Type_id = 1;
		TQ.Type_name = "Tu luan";
		
		// create categoryQuestion
		CategoryQuestion CQ = new CategoryQuestion();
		CQ.category_id = 1;
		CQ.category_name = "Hung";
		
		
		// create Question
		
		Question Q = new Question();
		Q.question_id = 1;
		Q.content = "content 1";
		Q.category_id = CQ;
		Q.creator_id = G;
		Q.type_id = TQ;
		Q.createDate = new Date("2000/05/01");
		
		
		// create answer
		
		Answer AS = new Answer();
		AS.answer_id = 1;
		AS.content = "content 1";
		AS.question_id = Q;
		AS.isCorrect = true;
		
		// create Exam
		Exam EX = new Exam();
		EX.exam_id = 1;
		EX.title = "title 1";
		EX.code = "code1";
		EX.category_id = CQ;
		EX.creator_id = G;
		EX.duration = 60;
		EX.createDate = new Date("2000/03/03");
		
		// create ExamQuestion
		
		ExamQuestion EQ = new ExamQuestion();
		EQ.equestion_id = Q;
		EQ.exam_id = EX;
		
		
		// Hien thi
		
		System.out.println("=========hien thi =========");
		System.out.println("Department: \n"+"ID: "+ D.department_id +"\nName: "+D.department_name);
		System.out.println("ID: "+ D.department_id +"\nName: "+D.department_name);
		
		
	}

}
