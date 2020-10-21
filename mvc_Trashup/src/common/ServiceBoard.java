package common;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ServiceBoard {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) ;

}
