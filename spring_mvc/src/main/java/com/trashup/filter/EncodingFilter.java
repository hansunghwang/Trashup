package com.trashup.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	private String encoding = null;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding  = filterConfig.getInitParameter("encoding");
		System.out.println(filterConfig.getFilterName() + "필터가 시작되었습니다,");
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(request.getCharacterEncoding()== null) {
			if(encoding != null) {
				request.setCharacterEncoding(encoding);
				response.setCharacterEncoding(encoding);
			}
		}
		chain.doFilter(request, response);
		
	}

	@Override
	public void destroy() {
	}
	

}
