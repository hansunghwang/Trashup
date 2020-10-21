package common;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ServiceNotice {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) ;

}
