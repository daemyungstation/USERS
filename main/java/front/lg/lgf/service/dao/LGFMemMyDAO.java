package front.lg.lgf.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 모바일 민원 처리를 위한 DAO
 * </pre>
 * 
 * @ClassName		: LGFMemMyDAO.java
 * @Description		: 모바일 민원 처리를 위한 DAO
 * @author 이너스커뮤니티
 * @since 2022.02.07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2022.02.07		   이너스커뮤니티				  최초 생성
 * </pre>
 */ 

@Repository("lGFMemMyDAO")
public class LGFMemMyDAO extends EmfAbstractDAO {

	/**
	 * CI기반 회원정보 get
	 *
	 * @param emfMap
	 * @return
	 */
	public List getInfoByCI(EmfMap emfMap) {
		return list("LGFMemMyDAO.getInfoByCI", emfMap);
	}
	
	/**
     * 회원 정보를 수정한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void updateMemInf(EmfMap emfMap) throws Exception
	{
		update("LGFMemMyDAO.updateMemInf", emfMap);
	}
}
