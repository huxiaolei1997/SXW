package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {
	String passUrl = "";
    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
        HttpServletRequest httpServletRequest = (HttpServletRequest) request; 
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        String[] strArray = passUrl.split(";");
        for (String str : strArray) {
            if (str.equals(""))
                continue;
            if (httpServletRequest.getRequestURL().indexOf(str) >= 0) {
                chain.doFilter(request, response);
                return;//用于void的返回，它不返回任何值，用于在void即返回值为空的函数中在任意点结束该函数
            }
        }
        
		// pass the request along the filter chain
        HttpSession httpSession = httpServletRequest.getSession();
        String adminName = (String) httpSession.getAttribute("adminName");
        String path = httpServletRequest.getContextPath();
        if(adminName != null){
        	chain.doFilter(request, response);
        } else {
        	httpServletResponse.sendRedirect(path + "/test2/login.jsp"); //如果adminName的值为空，则重定向到登录界面
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		 passUrl = arg0.getInitParameter("passUrl");

	}

}
