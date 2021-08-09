package JavaCode;

public class Page {
	String pUrl;
	String pTitle;
	String pIntro;
	String pContent;
	String pUser;
	String pDate;

	public Page() {
		
	}
	public Page(String url, String title, String intro, String content, String user, String date) {
		this.pUrl = url;
		this.pTitle = title;
		this.pIntro = intro;
		this.pContent = content;
		this.pUser = user;
		this.pDate = date;
	}
	public String getpUrl() {
		return pUrl;
	}
	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpIntro() {
		return pIntro;
	}
	public void setpIntro(String pIntro) {
		this.pIntro = pIntro;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpUser() {
		return pUser;
	}
	public void setpUser(String pUser) {
		this.pUser = pUser;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	
}
