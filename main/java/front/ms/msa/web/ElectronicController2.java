package front.ms.msa.web;

import java.io.FileNotFoundException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.coc.service.COCBoardMngService;
import front.ml.mlc.service.MLCPfmcInfService;

/**
 * <pre> 
 * lg가전전환서비스를 위한 Controller
 * </pre>
 * 
 * @ClassName		: PRALifeMgznController.java
 * @Description		: lg가전전환서비스를 위한 Controller
 * @author 
 * @since 2020.07.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2020.07.02		   				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/movement")
public class ElectronicController2 extends EmfController {

	/**
     * 멤버십 서비스 > OK캐쉬백 안내 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getOkcashbagGuidePage2() throws Exception
	{
		return "front/ms/msa/Index2.pop";
	}
	
}
