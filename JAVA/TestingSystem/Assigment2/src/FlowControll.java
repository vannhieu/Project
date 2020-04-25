//import java.text.DateFormat;
import java.util.Date;
//import java.util.Locale;

public class FlowControll {

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
				
				Account A1 = new Account();
				A1.account_id = 1;
				A1.email 	= "NguyenVanA@gmail.com";
				A1.fullname = "Nguyen Van A";
				A1.userName = "A";
				A1.department_id = D;
				A1.position_id = P;
				A1.createDate = new Date("2000/02/12");
				
				Account A2 = new Account();
				A2.account_id = 1;
				A2.email 	= "NguyenVanA@gmail.com";
				A2.fullname = "Nguyen Van A";
				A2.userName = "A";
				A2.department_id = D;
				A2.position_id = P;
				A2.createDate = new Date("2000/02/12");
				
				// create group
				Group G = new Group();
				G.group_id = 1;
				G.group_name ="group 1";
				G.creator_id = 1;
				G.createDate = new Date("2000/03/05");
				
				Group G1 = new Group();
				G1.group_id = 1;
				G1.group_name ="group 1";
				G1.creator_id = 1;
				G1.createDate = new Date("2000/03/05");
				// create GroupAcount
				
				GroupAccount GA = new GroupAccount();
				GA.Account_id = A;
				GA.Group_id = G;
				//
	/*/ Question 1:
		if(A2.department_id == null)
		{
			System.out.println("nhan vien nay chua co phong ban.");
		}
		else
			System.out.println("phong ban nay nhan vien la: "+A2.department_id.department_name);
		
	// Question 2:
		//Kiểm tra account thứ 2,
		//Nếu không có phòng ban thì sẽ in ra text "Nhân viên này chưa
		//có phòng ban"
		//Nếu có mặt trong 1 hoặc 2 phòng ban thì sẽ in ra text "Phòng
		//ban của nhân viên này là sale, marketting"
		//Nếu có mặt trong 3 phòng ban thì sẽ in ra text "Nhân viên này
		//là người quan trọng, tham gia nhiều phòng ban"
		//Nếu có mặt trong 4 phòng ban trở lên thì sẽ in ra text "Nhân
		//viên này là người hóng chuyện, tham gia tất cả các phòng ban"
		if(A2.Groups == null)
		{
			System.out.println("nhan vien ko co group nao");
		}
		else if(A2.Groups.length == 1|| A2.Groups.length == 2)
		{
			System.out.println("group nhan vien nay la ..");
		}
		else if(A2.Groups.length == 3)
		{
			System.out.println("group nhan vien nay la nguoi quan trong");
		}
		else
			System.out.println("group nhan vien nay la nguoi hong chuyen");
		
		// Question 3
		
		System.out.println(A2.department_id == null ? "nhan vien khong co phong ban": "nhan vien co phong ban la: "+ A2.department_id.department_name);
		
		// Question 4
		System.out.println(A1.position_id.position_name == "DEV" ? "Đây là Developer":"Người này không phải là\r\n" + "Người này không phải là Developer");
		
		
		
		//Question 5*/
		switch(G1.account.length)
		{
			case 1: 
				System.out.println("Nhóm có một thành viên");
				break;
			case 2:
				System.out.println("Nhóm có một thành viên");
				break;
			case 3:
				System.out.println("Nhóm có một thành viên");
				break;
			default:
				System.out.println("default");
		}
		
	}

	
	
}	
	
	
