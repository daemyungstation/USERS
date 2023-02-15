package front.ms.msa.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import emf.core.extend.web.EmfController;

/**
 * <pre> 
 * 골프 안내 페이지 Controller
 * </pre>
 * 
 * @ClassName		: GolfController.java
 * @Description		: 골프 안내 페이지  Controller
 * @author 
 * @since 2021.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2021.03.04		   				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/golf")
public class GolfController extends EmfController {

	/**
     * 골프 안내 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String golfPage() throws Exception
	{
		return "front/ms/msa/MSAGolf.pop";
	}
	
}
