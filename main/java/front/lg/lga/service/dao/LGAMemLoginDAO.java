package front.lg.lga.service.dao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 회원 로그인을 위한 DAO
 * </pre>
 * 
 * @ClassName		: LGAMemLoginDAO.java
 * @Description		: 회원 로그인을 위한 DAO
 * @author 김필기
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   김필기				  최초 생성
 * </pre>
 */ 
@Repository("lGAMemLoginDAO")
public class LGAMemLoginDAO extends EmfAbstractDAO {

	/**
	 * 로그인 일자를 변경한다.
	 *
	 * @param emfMap
	 * @throws Exception
	 */
    public void updateMemLoginInf(EmfMap emfMap) {
    	update("LGAMemLoginDAO.updateMemLoginInf", emfMap);
    }

	/**
	 * 리조트 정보를 가져온다.
	 *
	 * @param emfMap
	 * @return
	 */
	public List getMemResortInf(EmfMap emfMap) {
		return list("LGAMemLoginDAO.getMemResortInf", emfMap);
	}

	/**
	 * 통합 회원 정보 조회
	 *
	 * @param emfMap
	 * @return
	 */
	public EmfMap getIntegrationMemberInfo(EmfMap emfMap) {
		return (EmfMap) selectByPk("LGAMemLoginDAO.getIntegrationMemberInfo", emfMap);
	}

	/**
	 * 홈페이지 회원 정보 조회
	 *
	 * @param ci
	 * @param id
	 * @return
	 */
	public EmfMap getHomepageMemberInfo(String ci, String id, String unqNo) {
		EmfMap emfMap= new EmfMap();
		emfMap.put("ci", ci);
		emfMap.put("id", id);
		emfMap.put("unqNo", unqNo);
		return (EmfMap) selectByPk("LGAMemLoginDAO.getHomepageMemberInfo", emfMap);
	}

	public void putIntegrationMemberInfo(EmfMap emfMap) {
		 update("LGAMemLoginDAO.putIntegrationMemberInfo", emfMap);
	}

//	public List<EmfMap> getMallMemberInfo(String ci) {
//		return list("LGAMemLoginDAO.getMallMemberInfo", ci);
//	}

	/**
	 * 홈페이지 회원 정보 수정
	 *
	 * @param emfMap
	 */
	public void updateHomepageMemberInfo(EmfMap emfMap, String type) {
		emfMap.put("type", type);
		update("LGAMemLoginDAO.updateHomepageMemberInfo", emfMap);
	}

	public void updateHomepageMemberInfoSso(EmfMap emfMap, String type) {
		emfMap.put("type", type);
		update("LGAMemLoginDAO.updateHomepageMemberInfoSso", emfMap);
	}

	/**
	 * 홈페이지 회원 기타 정보 수정
	 *
	 * @param emfMap
	 */
	public void updateHomepageMemberEtcInfo(EmfMap emfMap, String type) {
		emfMap.put("type", type);
		update("LGAMemLoginDAO.updateHomepageMemberEtcInfo", emfMap);
	}

	public void updateHomepageMemberEtcInfoSso(EmfMap emfMap, String type) {
		emfMap.put("type", type);
		update("LGAMemLoginDAO.updateHomepageMemberEtcInfoSso", emfMap);
	}

	/**
	 * 홈페이지 부가식별 정보 수정
	 *
	 * @param emfMap
	 */
	public void updateHomepageMemberIndtInfoSso(EmfMap emfMap, String type) {
		emfMap.put("type", type);
		update("LGAMemLoginDAO.updateHomepageMemberIndtInfoSso", emfMap);
	}

	public void putHomepageIdToIntegrationMember(EmfMap emfMap) {
		update("LGAMemLoginDAO.putHomepageIdToIntegrationMember", emfMap);
	}

	public void syncHomepageIdToSSO(EmfMap emfMap) throws Exception {
		update("LGAMemLoginDAO.syncHomepageIdToSSO", emfMap);
	}

}
