package st.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class CustomExceptionResolver implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest arg0,
										 HttpServletResponse arg1, Object arg2, Exception ex) {

		CustomException customException = null;
		if(ex instanceof CustomException){
			customException = (CustomException)ex;
		}else{
			customException = new CustomException("未知异常");
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("error", customException.getMessage());
		mv.setViewName("/error");
		return mv;
	}

}
