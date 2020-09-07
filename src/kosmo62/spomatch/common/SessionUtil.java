package kosmo62.spomatch.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public abstract class SessionUtil {
	
	private static final String SESSION_KEY = "smb_no";
	private static final String MANAGER_KEY = "smb_mf"; 
	
	public static boolean newSession(final HttpServletRequest request,final String smb_no,final String smb_mf){
		System.out.println("SessionUtil class의 newSession()함수");
		
		HttpSession hs = request.getSession(false);
		if(hs != null) {
			String seVal = (String)hs.getAttribute(SESSION_KEY);
			if(seVal != null) {
				if(seVal.equals(smb_no)) {
					//이미 같은 아이디 로그인 중
					return false;
				}else {
					//다른아이디 로그인 중
					hs.invalidate();
					hs = request.getSession();
					hs.setAttribute(SESSION_KEY, smb_no);
					hs.setAttribute(MANAGER_KEY, smb_mf);
					hs.setMaxInactiveInterval(60*60);
				}
			}else {				
				//로그인 안되있을 때
				hs.setAttribute(SESSION_KEY, smb_no);
				hs.setAttribute(MANAGER_KEY, smb_mf);
				hs.setMaxInactiveInterval(60*60);
			}
		}else {
			//세션이 없을 때
			hs = request.getSession();
			hs.setAttribute(SESSION_KEY, smb_no);
			hs.setAttribute(MANAGER_KEY, smb_mf);
			hs.setMaxInactiveInterval(60*60);
		}
			
		return true;
	}// end of newSession()함수
	
	public static boolean killSession(final HttpServletRequest request){
		
		HttpSession hs = request.getSession(false);
		if(hs != null){
			String seVal = (String)hs.getAttribute(SESSION_KEY);
			if(seVal != null) {
				hs.removeAttribute(SESSION_KEY);
				hs.removeAttribute(MANAGER_KEY);
				hs.invalidate();				
			}else {
				//로그인 중이 아님
				return false;
			}
		}else {
			//로그인 중이 아님
			return false;
		}
		return true;
	}// end of killSession

	
}// end of SessionUtil class


