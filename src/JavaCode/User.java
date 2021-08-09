package JavaCode;

public class User {
	String uID;
	String uPassWord;
	String uName;
	int uPageNum;
	String uPagesSet;
	
	public User() {
		
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public String getuPassWord() {
		return uPassWord;
	}
	public void setuPassWord(String uPassWord) {
		this.uPassWord = uPassWord;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getuPageNum() {
		return uPageNum;
	}
	public void setuPageNum(int uPageNum) {
		this.uPageNum = uPageNum;
	}
	public String getuPagesSet() {
		return uPagesSet;
	}
	public void setuPagesSet(String uPagesSet) {
		this.uPagesSet = uPagesSet;
	}
}
