package ourbook;
import java.io.Serializable;

public class BookBuyBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String user_id;
	private int book_id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
}
