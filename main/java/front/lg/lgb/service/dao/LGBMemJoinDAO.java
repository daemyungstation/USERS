package front.lg.lgb.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

import java.util.List;

/**
 * <pre> 
 * 회원 가입을 위한 DAO
 * </pre>
 * 
 * @ClassName		: LGBMemJoinDAO.java
 * @Description		: 회원 가입을 위한 DAO
 * @author 김필기
 * @since 2016.03.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.02		   김필기				  최초 생성
 * </pre>
 */ 
@Repository("lGBMemJoinDAO")
public class LGBMemJoinDAO extends EmfAbstractDAO {
	
	/**
	 * 회원정보를 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public void insertMemInf(EmfMap emfMap) throws Exception
    {
    	insert("LGBMemJoinDAO.insertMemInf", emfMap);
    }

	/**
	 *
	 * @param emfMap
	 */
	public void insertIntegrationMemInf(EmfMap emfMap) {
    	insert("LGBMemJoinDAO.insertIntegrationMemInf", emfMap);
	}
	/**
	 * 회원 추가정보를 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public void insertMemEtcInf(EmfMap emfMap) throws Exception {
//    	System.out.print("insertMemEtcInf :: ");
//    	System.out.println(emfMap);
    	insert("LGBMemJoinDAO.insertMemEtcInf", emfMap);
    }

	/**
	 * 통합 회원 전환
	 *
	 * @param emfMap
	 */
	public void changeIntegrationMemInf(EmfMap emfMap) {
    	update("LGBMemJoinDAO.changeIntegrationMemInf", emfMap);
	}

	/**
	 * 유저의 로그인 실패 횟수 조회
	 *
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public EmfMap selectMemLgnCnt(String id) throws Exception {
    	return (EmfMap) selectByPk("LGBMemJoinDAO.selectMemLgnCnt", id);
    }

	/**
	 * 유저의 로그인 실패 횟수 조회
	 *
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public EmfMap selectMemLgnCntByCi(String ci) throws Exception {
    	return (EmfMap) selectByPk("LGBMemJoinDAO.selectMemLgnCntByCi", ci);
    }

	/**
	 * 유저의 로그인 실패 횟수 입력
	 *
	 * @param id
	 */
	public void insertMemLgnCnt(String id) {
    	insert("LGBMemJoinDAO.insertMemLgnCnt", id);
    }

	/**
	 * 유저의 로그인 실패 횟수 수정
	 *
	 * @param emfMap
	 */
	public void updateMemLgnCnt(EmfMap emfMap) {
    	update("LGBMemJoinDAO.updateMemLgnCnt", emfMap);
    }

	/**
	 * 유저의 로그인 실패 횟수 삭제 (초기화)
	 * @param id
	 */
	public void deleteMemLgnCnt(String id) {
    	delete("LGBMemJoinDAO.deleteMemLgnCnt", id);
	}
    
	/**
	 * 회원 정보를 가져온다(아이디, 이메일 중복검사 혼용)
	 * 
	 * @param emfMap (check : id or email)
	 * @return EmfMap
	 * @throws Exception 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInf(EmfMap emfMap) throws Exception {
		return (EmfMap) selectByPk("LGBMemJoinDAO.selectMemInf", emfMap);
	}

	/**
	 * 회원 정보를 가져온다(회원 및 휴면 회원 테이블에서)
	 * 
	 * @param ci
	 * @return EmfMap
	 * @throws Exception 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInfFromMemAndQscnMem(EmfMap emfMap) throws Exception {
		return (EmfMap) selectByPk("LGBMemJoinDAO.selectMemInfFromMemAndQscnMem", emfMap);
	}
	
	/**
	 * 통합 회원 이메일 중복 체크
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public int checkDuplicateEmail(EmfMap emfMap) throws Exception {
		return (Integer) selectByPk("checkDuplicateEmail", emfMap);
	}

	/**
	 * 통합 회원 가입 정보 조회.
	 *
	 * @param ci
	 * @return
	 * @throws Exception
	 */
	public List<EmfMap> selectIntegrationMemberInfo(String ci, String id) {
		EmfMap emfMap = new EmfMap();
		emfMap.put("ci", ci);
		emfMap.put("id", id);
		return list("LGBMemJoinDAO.selectIntegrationMemberInfo", emfMap);
	}

	public List<EmfMap> selectIntegrationDeleteMemberInfo(String ci) throws Exception {
		return list("LGBMemJoinDAO.selectIntegrationDeleteMemberInfo", ci);
	}

	public void dropIntegrationInfo(EmfMap emfMap) {
		update("LGBMemJoinDAO.dropIntegrationInfo", emfMap);
	}

	/**
	 * 상조 회원 가입 정보 조회.
	 *
	 * @param ci
	 * @return
	 * @throws Exception
	 */
	public List<EmfMap> selectFuneralMemberInfo(String ci) {
		return list("LGBMemJoinDAO.selectFuneralMemberInfo", ci);
	}

	/**
	 * 사용가능한 아이디 확인.
	 *
	 * @param type
	 * @param id
	 * @return
	 */
	public int checkAvailableAccount(String type, String id) {
		EmfMap emfMap = new EmfMap();
		emfMap.put("type", type);
		emfMap.put("id", id);
		return (Integer) selectByPk("LGBMemJoinDAO.checkAvailableAccount", emfMap);
	}
	
	/**
	 * 변경 정보를 저장한다.(임시 테이블역활)
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public void insertMemChngPtc(EmfMap emfMap) throws Exception
    {
    	insert("LGBMemJoinDAO.insertMemChngPtc", emfMap);
    }    

	/**
	 * 비밀번호를 변경한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public void updateMemPwdInf(EmfMap emfMap) throws Exception {
    	update("LGBMemJoinDAO.updateMemPwdInf", emfMap);
    }

	/**
	 * 통합 회원 비밀번호 변경.
	 *
	 * @param emfMap
	 */
	public void updateIntegrationMemPwdInf(EmfMap emfMap) {
		update("LGBMemJoinDAO.updateIntegrationMemPwdInf", emfMap);
	}
	
	public void updateMemAgreement(EmfMap emfMap) throws Exception
    {
    	update("LGBMemJoinDAO.updateMemAgreement", emfMap);
    }    

	/**
	 * 본인 인증 정보를 저장한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public void insertIdntInf(EmfMap emfMap) throws Exception
    {
    	insert("LGBMemJoinDAO.insertIdntInf", emfMap);
    } 
	
	
	  public int selectMemIdEmailCheck(EmfMap emfMap)
	    throws Exception
	  {
	    return ((Integer)selectByPk("LGBMemJoinDAO.selectMemIdEmailCheck", emfMap)).intValue();
	  }
	  
	  public int selectQscnMemIdEmailCheck(EmfMap emfMap)
	    throws Exception
	  {
	    return ((Integer)selectByPk("LGBMemJoinDAO.selectQscnMemIdEmailCheck", emfMap)).intValue();
	  }
	  
	  public int selectDrotMemIdEmailCheck(EmfMap emfMap)
			  throws Exception
	  {
		  return ((Integer)selectByPk("LGBMemJoinDAO.selectDrotMemIdEmailCheck", emfMap)).intValue();
	  }
	
}
