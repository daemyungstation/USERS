package front.co.util;

import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.gimpy.DropShadowGimpyRenderer;
import nl.captcha.text.producer.NumbersAnswerProducer;

public class COCaptchaServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			//200 * 50 에 해당하는 이미지 사이즈를 지정하고, 자동가입방지 문자 길이를 설정한다.
			Captcha captcha = new Captcha.Builder(110, 60).addText(new NumbersAnswerProducer())
														  .gimp(new DropShadowGimpyRenderer())
														  .addBackground(new GradiatedBackgroundProducer())
														  .build();
			
			//캐쉬를 지우기 위해 헤더값을 설정
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			
			//리턴값을 image형태로 설정
			response.setContentType("image/jpeg");
			
			//세션에 자동방지 문자를 저장한다.
			request.getSession().removeAttribute("CurrentAnswer");
			request.getSession().setAttribute("CurrentAnswer", captcha.getAnswer());
			
			//Image를 write 한다
			ImageIO.write(captcha.getImage(), "jpeg", ((OutputStream)(response.getOutputStream())));
			((OutputStream)(response.getOutputStream())).close();
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}
	}
}
